class AddSkuIndexes < ActiveRecord::Migration
  def change
  	add_index :products, :base_sku
  	add_index :variants, :sku
  	add_index :variants, :amazon_product_id
    add_index :mws_order_items, :clean_sku
    add_index :products, :category

  end
end
