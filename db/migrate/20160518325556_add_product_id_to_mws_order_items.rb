class AddProductIdToMwsOrderItems < ActiveRecord::Migration
  def change
    add_column :mws_order_items, :product_id, :integer
    add_column :mws_order_items, :variant_id, :integer
    add_column :mws_order_items, :sub_variant_id, :integer
  end
end
