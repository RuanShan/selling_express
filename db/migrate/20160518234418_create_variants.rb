class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.integer :product_id
      t.string :sku
      t.decimal :price
      t.decimal :cost_price
      t.decimal :weight
      t.decimal :height
      t.decimal :width
      t.decimal :depth
      t.string :size
      t.string :color1
      t.string :color2
      t.string :color1_code
      t.string :color2_code
      t.string :availability
      t.datetime :deleted_at
      t.boolean :is_master
      t.integer :position
      t.text :amazon_description
      t.string :upc
      t.string :size_code

      t.timestamps
    end
  end
end
