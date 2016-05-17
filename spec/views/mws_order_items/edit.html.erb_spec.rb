require 'rails_helper'

RSpec.describe "mws_order_items/edit", type: :view do
  before(:each) do
    @mws_order_item = assign(:mws_order_item, MwsOrderItem.create!(
      :asin => "MyString",
      :amazon_order_item_id => "MyString",
      :seller_sku => "MyString",
      :title => "MyString",
      :quantity_ordered => 1,
      :quantity_shipped => 1,
      :item_price => 1.5,
      :item_price_currency => "MyString",
      :shipping_price => 1.5,
      :shipping_price_currency => "MyString",
      :gift_price => 1.5,
      :gift_price_currency => "MyString",
      :item_tax => 1.5,
      :item_tax_currency => "MyString",
      :shipping_tax => 1.5,
      :shipping_tax_currency => "MyString",
      :gift_tax => 1.5,
      :gift_tax_currency => "MyString",
      :shipping_discount => 1.5,
      :shipping_discount_currency => "MyString",
      :promotion_discount => 1.5,
      :promotion_discount_currency => "MyString",
      :gift_wrap_level => "MyString",
      :gift_message_text => "MyString",
      :mws_order_id => 1,
      :amazon_order_id => "MyString"
    ))
  end

  it "renders the edit mws_order_item form" do
    render

    assert_select "form[action=?][method=?]", mws_order_item_path(@mws_order_item), "post" do

      assert_select "input#mws_order_item_asin[name=?]", "mws_order_item[asin]"

      assert_select "input#mws_order_item_amazon_order_item_id[name=?]", "mws_order_item[amazon_order_item_id]"

      assert_select "input#mws_order_item_seller_sku[name=?]", "mws_order_item[seller_sku]"

      assert_select "input#mws_order_item_title[name=?]", "mws_order_item[title]"

      assert_select "input#mws_order_item_quantity_ordered[name=?]", "mws_order_item[quantity_ordered]"

      assert_select "input#mws_order_item_quantity_shipped[name=?]", "mws_order_item[quantity_shipped]"

      assert_select "input#mws_order_item_item_price[name=?]", "mws_order_item[item_price]"

      assert_select "input#mws_order_item_item_price_currency[name=?]", "mws_order_item[item_price_currency]"

      assert_select "input#mws_order_item_shipping_price[name=?]", "mws_order_item[shipping_price]"

      assert_select "input#mws_order_item_shipping_price_currency[name=?]", "mws_order_item[shipping_price_currency]"

      assert_select "input#mws_order_item_gift_price[name=?]", "mws_order_item[gift_price]"

      assert_select "input#mws_order_item_gift_price_currency[name=?]", "mws_order_item[gift_price_currency]"

      assert_select "input#mws_order_item_item_tax[name=?]", "mws_order_item[item_tax]"

      assert_select "input#mws_order_item_item_tax_currency[name=?]", "mws_order_item[item_tax_currency]"

      assert_select "input#mws_order_item_shipping_tax[name=?]", "mws_order_item[shipping_tax]"

      assert_select "input#mws_order_item_shipping_tax_currency[name=?]", "mws_order_item[shipping_tax_currency]"

      assert_select "input#mws_order_item_gift_tax[name=?]", "mws_order_item[gift_tax]"

      assert_select "input#mws_order_item_gift_tax_currency[name=?]", "mws_order_item[gift_tax_currency]"

      assert_select "input#mws_order_item_shipping_discount[name=?]", "mws_order_item[shipping_discount]"

      assert_select "input#mws_order_item_shipping_discount_currency[name=?]", "mws_order_item[shipping_discount_currency]"

      assert_select "input#mws_order_item_promotion_discount[name=?]", "mws_order_item[promotion_discount]"

      assert_select "input#mws_order_item_promotion_discount_currency[name=?]", "mws_order_item[promotion_discount_currency]"

      assert_select "input#mws_order_item_gift_wrap_level[name=?]", "mws_order_item[gift_wrap_level]"

      assert_select "input#mws_order_item_gift_message_text[name=?]", "mws_order_item[gift_message_text]"

      assert_select "input#mws_order_item_mws_order_id[name=?]", "mws_order_item[mws_order_id]"

      assert_select "input#mws_order_item_amazon_order_id[name=?]", "mws_order_item[amazon_order_id]"
    end
  end
end
