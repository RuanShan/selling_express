class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.integer :product_id
      t.integer :store_id
      t.string :handle
      t.string :foreign_id
      t.integer :mws_request_id
      t.string :status

      t.string :operation_type, :string
      t.string :build_at, :string

      t.timestamps
    end
  end
end
