require 'rails_helper'

RSpec.describe "MwsOrderItems", type: :request do
  describe "GET /mws_order_items" do
    it "works! (now write some real specs)" do
      get mws_order_items_path
      expect(response).to have_http_status(200)
    end
  end
end
