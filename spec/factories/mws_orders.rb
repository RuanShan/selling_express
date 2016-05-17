FactoryGirl.define do
  factory :mws_order do
    amazon_order_id "MyString"
seller_order_id "MyString"
purchase_date "2016-05-17 14:27:54"
last_update_date "2016-05-17 14:27:54"
order_status "MyString"
fulfillment_channel "MyString"
sales_channel "MyString"
order_channel "MyString"
ship_service_level "MyString"
amount 1.5
currency_code "MyString"
address_line_1 "MyString"
address_line_2 "MyString"
address_line_3 "MyString"
city "MyString"
county "MyString"
district "MyString"
state_or_region "MyString"
postal_code "MyString"
country_code "MyString"
phone "MyString"
number_of_items_shipped 1
number_of_items_unshipped 1
marketplace_id "MyString"
buyer_name "MyString"
buyer_email "MyString"
ship_service_level_category "MyString"
mws_response_id 1
  end

end
