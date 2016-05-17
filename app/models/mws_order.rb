class MwsOrder < ActiveRecord::Base
	belongs_to :mws_response
	belongs_to :store
	has_many :mws_order_items, :dependent => :destroy
	has_many :omx_requests
	has_many :omx_responses, :through => :omx_requests
	validates_uniqueness_of :amazon_order_id
	validates_presence_of :mws_response_id
	validates_presence_of :purchase_date
	validates_associated :store
	default_scope ->{ order( 'purchase_date DESC' ) }

	MAX_ORDER_ITEM_PAGES = 20
	MAX_FAILURE_COUNT = 1
	ORDER_ITEM_FAIL_WAIT = 60

	# return a list of skus that, as yet, have not been matched up to products, variants, or sub_variants
	def self.get_unmatched_skus
		where(:id => MwsOrderItem.get_unmatched_skus)
	end

	def self.search(search)
		# get sub_matches from order_items
		o1 = MwsOrderItem.search(search)

		# get direct matches at order level
		fields = [ 'amazon_order_id', 'seller_order_id', 'address_line_1', 'address_line_2', 'address_line_3', 'city', 'state_or_region', 'country_code', 'postal_code', 'buyer_name', 'buyer_email', 'shipment_service_level_category', 'name']
		bind_vars = MwsHelper::search_helper(fields, search)
		o2 = select('id').where(bind_vars).collect { |o| o.id }

		# combine the two arrays of IDs and remove duplicates, and return all relevant records
		where(:id => o1 | o2)
	end

	# return a value between 0 and 6 for the number of seconds to delay between OrderItem requests to Amazon
	def self.get_sleep_time_per_order(order_count)
		if order_count.is_a?(Numeric) && order_count>0
			sleep_time = 0.0
			request_buffer = 15.0
			refresh_interval = 5.0
			sleep_time = (([order_count - request_buffer, 0.0].max) / order_count)*refresh_interval
			return sleep_time
		else
			return 0
		end
	end

  # set each item in an order to shipped
	def set_shipped
		self.mws_order_items.each do |i|
			i.set_shipped
		end
	end

	def get_item_quantity_ordered
		q = 0
		q += self.number_of_items_unshipped ? self.number_of_items_unshipped : 0
		q += self.number_of_items_shipped ? self.number_of_items_shipped : 0
		return q
	end

	def get_item_quantity_loaded
		q = 0
		self.mws_order_items.each do |i|
			q += i.quantity_ordered
		end
		return q
	end

	def get_item_quantity_missing
		return get_item_quantity_ordered - get_item_quantity_loaded
	end

	def get_item_price
		total = 0
		self.mws_order_items.each do |i|
			total += i.get_item_price
		end
		return total
	end

	def get_ship_price
		total = 0
		self.mws_order_items.each do |i|
			total += i.get_ship_price
		end
		return total
	end

	def get_gift_price
		total = 0
		self.mws_order_items.each do |i|
			total += i.get_gift_price
		end
		return total
	end

	def get_total_price
		total = 0
		self.mws_order_items.each do |i|
			total += i.get_total_price
		end
		return total
	end

	def pushed_to_omx?
		pushed = "Error"
		if self.fulfillment_channel == "AFN"
			return 'N/A'
		elsif (self.order_status != 'Unshipped' && self.order_status != 'PartiallyShipped')
			return 'Shipped'
		end
		self.omx_responses.each do |resp|
			if !resp.ordermotion_order_number.nil? && resp.ordermotion_order_number != ''
				pushed = 'Yes'
			elsif resp.error_data.nil? || resp.error_data == ''
				pushed = 'No'
			elsif !resp.error_data.match(/The provided Order ID has already been used for the provided store/).nil?
				pushed = 'Dup'
			end
		end
		return pushed
	end

	def reprocess_order
		store = self.store
		if !store.mws_connection.nil?
			return process_order(store.mws_connection)
		end
	end

	# Process XML order into ActiveRecord, and process items on order
	def process_order(mws_connection)
	  #puts "      PROCESS_ORDER: #{self.amazon_order_id}"
		return_code = fetch_order_items(mws_connection)

		#TODO if reprocessing, use the update OMX API call rather than append
		if get_item_quantity_missing == 0 && self.fulfillment_channel == "MFN" && (self.order_status == 'Unshipped' || self.order_status == 'PartiallyShipped')
		  #puts "      PROCESS_ORDER: about to append to omx"
			#append_to_omx
		else
		  #puts "      PROCESS_ORDER: not appending to omx, return code #{return_code}"
		end
		return return_code
	end

	# fetch items associated with this order
	# calls the Amazon MWS API
	def fetch_order_items(mws_connection)
	  #puts "        FETCH_ORDER_ITEMS: for order #{self.amazon_order_id}, about to call MWS ListOrderItems"
		parent_request = self.mws_response.mws_request
		request = MwsRequest.create!(:request_type => "ListOrderItems", :store_id => parent_request.store_id, :mws_request_id => parent_request.id)
		response = mws_connection.get_list_order_items(:amazon_order_id => self.amazon_order_id)
		#puts "        FETCH_ORDER_ITEMS: called MWS ListOrderItems, about to process response"
		next_token = request.process_response(mws_connection, response,0,0)
		#puts "        FETCH_ORDER_ITEMS: back, finished process_response"
		if next_token.is_a?(Numeric)
			return next_token
		end

		page_num = 1
		failure_count = 0
		while next_token.is_a?(String) && page_num<MAX_ORDER_ITEM_PAGES do
		  #puts "        FETCH_ORDER_ITEMS: next_token is present, about to fetch by next token for #{self.amazon_order_id}"
			response = mws_connection.get_list_order_items_by_next_token(:next_token => next_token)
			#puts "        FETCH_ORDER_ITEMS: called MWS ListOrderItemsByNextToken, about to process response"
			n = request.process_response(mws_connection,response,page_num,ORDER_ITEM_FAIL_WAIT)
			if n.is_a?(Numeric)
				failure_count += 1
				if failure_count >= MAX_FAILURE_COUNT
					return n
				end
			else
				page_num += 1 # don't want to increment page if there is an error
				next_token = n
			end
			#puts "        FETCH_ORDER_ITEMS: finished process_response for next token"
		end
		#puts "        FETCH_ORDER_ITEMS: finishing order #{self.amazon_order_id}"
	end

	def process_order_item(item, response_id)
	  #puts "              PROCESS_ORDER_ITEM: order #{self.amazon_order_id}, item #{item.amazon_order_item_id}"

		amz_item = MwsOrderItem.find_by_amazon_order_item_id(item.amazon_order_item_id)
		if amz_item.nil?
		  amz_item = MwsOrderItem.create(:amazon_order_item_id=>item.amazon_order_item_id, :seller_sku=>item.seller_sku, :mws_response_id=>response_id, :mws_order_id=>self.id, :amazon_order_id=>self.amazon_order_id)
		  #puts "              PROCESS_ORDER_ITEM: new item #{amz_item.amazon_order_item_id} created, id: #{amz_item.id}"
		else
		  #puts "              PROCESS_ORDER_ITEM: existing item #{amz_item.amazon_order_item_id} updated, id: #{amz_item.id}"
		end
		amz_item.update_attributes(item.attributes)
		#puts "              PROCESS_ORDER_ITEM: finished"
	end


end
