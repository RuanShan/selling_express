json.array!(@mws_orders) do |mws_order|
  json.extract! mws_order, :id, :amazon_order_id, :seller_order_id, :purchase_date, :last_update_date, :order_status, :fulfillment_channel, :sales_channel, :order_channel, :ship_service_level, :amount, :currency_code, :address_line_1, :address_line_2, :address_line_3, :city, :county, :district, :state_or_region, :postal_code, :country_code, :phone, :number_of_items_shipped, :number_of_items_unshipped, :marketplace_id, :buyer_name, :buyer_email, :ship_service_level_category, :mws_response_id
  json.url mws_order_url(mws_order, format: :json)
end
