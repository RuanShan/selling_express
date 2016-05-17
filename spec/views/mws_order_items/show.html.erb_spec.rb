require 'rails_helper'

RSpec.describe "mws_order_items/show", type: :view do
  before(:each) do
    @mws_order_item = assign(:mws_order_item, MwsOrderItem.create!(
      :asin => "Asin",
      :amazon_order_item_id => "Amazon Order Item",
      :seller_sku => "Seller Sku",
      :title => "Title",
      :quantity_ordered => 1,
      :quantity_shipped => 2,
      :item_price => 1.5,
      :item_price_currency => "Item Price Currency",
      :shipping_price => 1.5,
      :shipping_price_currency => "Shipping Price Currency",
      :gift_price => 1.5,
      :gift_price_currency => "Gift Price Currency",
      :item_tax => 1.5,
      :item_tax_currency => "Item Tax Currency",
      :shipping_tax => 1.5,
      :shipping_tax_currency => "Shipping Tax Currency",
      :gift_tax => 1.5,
      :gift_tax_currency => "Gift Tax Currency",
      :shipping_discount => 1.5,
      :shipping_discount_currency => "Shipping Discount Currency",
      :promotion_discount => 1.5,
      :promotion_discount_currency => "Promotion Discount Currency",
      :gift_wrap_level => "Gift Wrap Level",
      :gift_message_text => "Gift Message Text",
      :mws_order_id => 3,
      :amazon_order_id => "Amazon Order"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Asin/)
    expect(rendered).to match(/Amazon Order Item/)
    expect(rendered).to match(/Seller Sku/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Item Price Currency/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Shipping Price Currency/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Gift Price Currency/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Item Tax Currency/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Shipping Tax Currency/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Gift Tax Currency/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Shipping Discount Currency/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/Promotion Discount Currency/)
    expect(rendered).to match(/Gift Wrap Level/)
    expect(rendered).to match(/Gift Message Text/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Amazon Order/)
  end
end
