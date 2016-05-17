module PermittedAttributes

  ATTRIBUTES_FOR_MWS = [:mws_order_attributes]
  mattr_reader *ATTRIBUTES_FOR_MWS

  # "amazon_order_id"=>"103-3747207-1085855",
  # "is_prime"=>"false",
  # "seller_order_id"=>"103-3747207-1085855",
  # "purchase_date"=>2013-05-17 12:49:06 UTC,
  # "last_updated_at"=>2013-05-17 13:05:02 UTC,
  # "order_status"=>"Canceled",
  # "fulfillment_channel"=>"AFN",
  # "sales_channel"=>"Amazon.com",
  # "order_channel"=>nil,
  # "ship_service_level"=>"SecondDay",
  #? "shipping_address"=>nil,
  #? "total"=>#<Money fractional:7775 currency:USD>,
  # "number_of_items_shipped"=>0,
  # "number_of_items_unshipped"=>0,
  #? "payment_execution_detail"=>nil,
  #? "payment_method"=>"Other",
  # "marketplace_id"=>"ATVPDKIKX0DER",
  # "buyer_name"=>nil,
  # "buyer_email"=>nil,
  # "shipment_service_level_category"=>"SecondDay",
  #? "cba_displayable_shipping_label"=>nil,
  #? "shipped_by_amazon_tfm"=>nil,
  #? "tfm_shipment_status"=>nil,
  #? "type"=>"StandardOrder",
  #? "earliest_shipped_at"=>1970-01-01 00:00:00 UTC,
  #? "latest_shipped_at"=>1970-01-01 00:00:00 UTC,
  #? "is_premium_order"=>"false",
  #? "is_business_order"=>"false"

  @@mws_order_attributes = [ :amazon_order_id,:seller_order_id, :content_param, :data_source, :data_source_param, :css_class, :css_class_for_js, :content_css_class, :stylish, :section_context ]

end
