class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :store_type
      t.integer :order_results_per_page
      t.integer :max_order_pages
      t.string :queue_flag
      t.string :verify_flag
      t.string :authenticated_url

      t.timestamps null: false
    end
  end
end
