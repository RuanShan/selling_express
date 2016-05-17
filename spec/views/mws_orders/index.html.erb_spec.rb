require 'rails_helper'

RSpec.describe "mws_orders/index", type: :view do
  before(:each) do
    assign(:mws_orders, [
      MwsOrder.create!(
        :amazon_order_id => "Amazon Order",
        :seller_order_id => "Seller Order",
        :order_status => "Order Status",
        :fulfillment_channel => "Fulfillment Channel",
        :sales_channel => "Sales Channel",
        :order_channel => "Order Channel",
        :ship_service_level => "Ship Service Level",
        :amount => 1.5,
        :currency_code => "Currency Code",
        :address_line_1 => "Address Line 1",
        :address_line_2 => "Address Line 2",
        :address_line_3 => "Address Line 3",
        :city => "City",
        :county => "County",
        :district => "District",
        :state_or_region => "State Or Region",
        :postal_code => "Postal Code",
        :country_code => "Country Code",
        :phone => "Phone",
        :number_of_items_shipped => 1,
        :number_of_items_unshipped => 2,
        :marketplace_id => "Marketplace",
        :buyer_name => "Buyer Name",
        :buyer_email => "Buyer Email",
        :ship_service_level_category => "Ship Service Level Category",
        :mws_response_id => 3
      ),
      MwsOrder.create!(
        :amazon_order_id => "Amazon Order",
        :seller_order_id => "Seller Order",
        :order_status => "Order Status",
        :fulfillment_channel => "Fulfillment Channel",
        :sales_channel => "Sales Channel",
        :order_channel => "Order Channel",
        :ship_service_level => "Ship Service Level",
        :amount => 1.5,
        :currency_code => "Currency Code",
        :address_line_1 => "Address Line 1",
        :address_line_2 => "Address Line 2",
        :address_line_3 => "Address Line 3",
        :city => "City",
        :county => "County",
        :district => "District",
        :state_or_region => "State Or Region",
        :postal_code => "Postal Code",
        :country_code => "Country Code",
        :phone => "Phone",
        :number_of_items_shipped => 1,
        :number_of_items_unshipped => 2,
        :marketplace_id => "Marketplace",
        :buyer_name => "Buyer Name",
        :buyer_email => "Buyer Email",
        :ship_service_level_category => "Ship Service Level Category",
        :mws_response_id => 3
      )
    ])
  end

  it "renders a list of mws_orders" do
    render
    assert_select "tr>td", :text => "Amazon Order".to_s, :count => 2
    assert_select "tr>td", :text => "Seller Order".to_s, :count => 2
    assert_select "tr>td", :text => "Order Status".to_s, :count => 2
    assert_select "tr>td", :text => "Fulfillment Channel".to_s, :count => 2
    assert_select "tr>td", :text => "Sales Channel".to_s, :count => 2
    assert_select "tr>td", :text => "Order Channel".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Service Level".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Currency Code".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line 1".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line 2".to_s, :count => 2
    assert_select "tr>td", :text => "Address Line 3".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "County".to_s, :count => 2
    assert_select "tr>td", :text => "District".to_s, :count => 2
    assert_select "tr>td", :text => "State Or Region".to_s, :count => 2
    assert_select "tr>td", :text => "Postal Code".to_s, :count => 2
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Marketplace".to_s, :count => 2
    assert_select "tr>td", :text => "Buyer Name".to_s, :count => 2
    assert_select "tr>td", :text => "Buyer Email".to_s, :count => 2
    assert_select "tr>td", :text => "Ship Service Level Category".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
