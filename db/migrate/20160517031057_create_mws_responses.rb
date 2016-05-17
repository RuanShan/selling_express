class CreateMwsResponses < ActiveRecord::Migration
  def change
    create_table :mws_responses do |t|
      t.references :mws_request
      t.string :amazon_request_id
      t.string :next_token
      t.datetime :last_updated_before
      t.datetime :created_before
      t.string :request_type
      t.integer :page_num
      t.string :error_code
      t.text :error_message
      t.string :amazon_order_id

      t.timestamps null: false
    end
  end
end
