class AddFieldsToListingsAndRequests < ActiveRecord::Migration
  def change
    add_column :mws_requests, :feed_type, :string
    add_column :mws_requests, :message, :text
    add_column :mws_responses, :feed_submission_id, :string
    add_column :mws_responses, :processing_status, :string
  end
end
