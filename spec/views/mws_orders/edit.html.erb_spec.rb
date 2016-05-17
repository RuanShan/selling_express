require 'rails_helper'

RSpec.describe "mws_orders/edit", type: :view do
  before(:each) do
    @mws_order = assign(:mws_order, MwsOrder.create!(
      :amazon_order_id => "MyString",
      :seller_order_id => "MyString",
      :order_status => "MyString",
      :fulfillment_channel => "MyString",
      :sales_channel => "MyString",
      :order_channel => "MyString",
      :ship_service_level => "MyString",
      :amount => 1.5,
      :currency_code => "MyString",
      :address_line_1 => "MyString",
      :address_line_2 => "MyString",
      :address_line_3 => "MyString",
      :city => "MyString",
      :county => "MyString",
      :district => "MyString",
      :state_or_region => "MyString",
      :postal_code => "MyString",
      :country_code => "MyString",
      :phone => "MyString",
      :number_of_items_shipped => 1,
      :number_of_items_unshipped => 1,
      :marketplace_id => "MyString",
      :buyer_name => "MyString",
      :buyer_email => "MyString",
      :ship_service_level_category => "MyString",
      :mws_response_id => 1
    ))
  end

  it "renders the edit mws_order form" do
    render

    assert_select "form[action=?][method=?]", mws_order_path(@mws_order), "post" do

      assert_select "input#mws_order_amazon_order_id[name=?]", "mws_order[amazon_order_id]"

      assert_select "input#mws_order_seller_order_id[name=?]", "mws_order[seller_order_id]"

      assert_select "input#mws_order_order_status[name=?]", "mws_order[order_status]"

      assert_select "input#mws_order_fulfillment_channel[name=?]", "mws_order[fulfillment_channel]"

      assert_select "input#mws_order_sales_channel[name=?]", "mws_order[sales_channel]"

      assert_select "input#mws_order_order_channel[name=?]", "mws_order[order_channel]"

      assert_select "input#mws_order_ship_service_level[name=?]", "mws_order[ship_service_level]"

      assert_select "input#mws_order_amount[name=?]", "mws_order[amount]"

      assert_select "input#mws_order_currency_code[name=?]", "mws_order[currency_code]"

      assert_select "input#mws_order_address_line_1[name=?]", "mws_order[address_line_1]"

      assert_select "input#mws_order_address_line_2[name=?]", "mws_order[address_line_2]"

      assert_select "input#mws_order_address_line_3[name=?]", "mws_order[address_line_3]"

      assert_select "input#mws_order_city[name=?]", "mws_order[city]"

      assert_select "input#mws_order_county[name=?]", "mws_order[county]"

      assert_select "input#mws_order_district[name=?]", "mws_order[district]"

      assert_select "input#mws_order_state_or_region[name=?]", "mws_order[state_or_region]"

      assert_select "input#mws_order_postal_code[name=?]", "mws_order[postal_code]"

      assert_select "input#mws_order_country_code[name=?]", "mws_order[country_code]"

      assert_select "input#mws_order_phone[name=?]", "mws_order[phone]"

      assert_select "input#mws_order_number_of_items_shipped[name=?]", "mws_order[number_of_items_shipped]"

      assert_select "input#mws_order_number_of_items_unshipped[name=?]", "mws_order[number_of_items_unshipped]"

      assert_select "input#mws_order_marketplace_id[name=?]", "mws_order[marketplace_id]"

      assert_select "input#mws_order_buyer_name[name=?]", "mws_order[buyer_name]"

      assert_select "input#mws_order_buyer_email[name=?]", "mws_order[buyer_email]"

      assert_select "input#mws_order_ship_service_level_category[name=?]", "mws_order[ship_service_level_category]"

      assert_select "input#mws_order_mws_response_id[name=?]", "mws_order[mws_response_id]"
    end
  end
end
