class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.text :description
      t.datetime :available_on
      t.datetime :deleted_at
      t.text :meta_description
      t.string :meta_keywords
      t.integer :brand_id
      t.string :category
      t.string :amazon_name
      t.string :amazon_description
      
      t.timestamps
    end
  end
end
