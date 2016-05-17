class CreateMwsRequests < ActiveRecord::Migration
  def change
    create_table :mws_requests do |t|
      t.integer :mws_request_id
      t.references :store
      t.string :amazon_request_id
      t.string :request_type
      t.string :message_type
      t.string :feed_submission_id
      t.string :processing_status

      t.datetime :submitted_at
      t.datetime :started_at
      t.datetime :completed_at
      
      t.timestamps null: false
    end
  end
end
