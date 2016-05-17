require 'rails_helper'

RSpec.describe "mws_orders/show", type: :view do
  before(:each) do
    @mws_order = assign(:mws_order, MwsOrder.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Amazon Order/)
    expect(rendered).to match(/Seller Order/)
    expect(rendered).to match(/Order Status/)
    expect(rendered).to match(/Fulfillment Channel/)
    expect(rendered).to match(/Sales Channel/)
    expect(rendered).to match(/Order Channel/)
    expect(rendered).to match(/Ship Service Level/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Currency Code/)
    expect(rendered).to match(/Address Line 1/)
    expect(rendered).to match(/Address Line 2/)
    expect(rendered).to match(/Address Line 3/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/County/)
    expect(rendered).to match(/District/)
    expect(rendered).to match(/State Or Region/)
    expect(rendered).to match(/Postal Code/)
    expect(rendered).to match(/Country Code/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Marketplace/)
    expect(rendered).to match(/Buyer Name/)
    expect(rendered).to match(/Buyer Email/)
    expect(rendered).to match(/Ship Service Level Category/)
    expect(rendered).to match(/3/)
  end
end
