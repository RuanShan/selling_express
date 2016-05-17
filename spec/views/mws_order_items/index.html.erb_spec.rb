require 'rails_helper'

RSpec.describe "mws_order_items/index", type: :view do
  before(:each) do
    assign(:mws_order_items, [
      MwsOrderItem.create!(
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
      ),
      MwsOrderItem.create!(
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
      )
    ])
  end

  it "renders a list of mws_order_items" do
    render
    assert_select "tr>td", :text => "Asin".to_s, :count => 2
    assert_select "tr>td", :text => "Amazon Order Item".to_s, :count => 2
    assert_select "tr>td", :text => "Seller Sku".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Item Price Currency".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Shipping Price Currency".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Gift Price Currency".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Item Tax Currency".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Shipping Tax Currency".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Gift Tax Currency".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Shipping Discount Currency".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "Promotion Discount Currency".to_s, :count => 2
    assert_select "tr>td", :text => "Gift Wrap Level".to_s, :count => 2
    assert_select "tr>td", :text => "Gift Message Text".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Amazon Order".to_s, :count => 2
  end
end
