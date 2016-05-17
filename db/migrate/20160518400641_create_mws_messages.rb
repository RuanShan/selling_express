class CreateMwsMessages < ActiveRecord::Migration
  def change
    create_table :mws_messages do |t|
      t.integer :listing_id
      t.text :message
      t.integer :matchable_id
      t.string :matchable_type
      t.integer :variant_image_id
      t.integer :feed_type

      t.string :result_code
      t.string :message_code
      t.text :result_description

      t.timestamps
    end
  end
end
