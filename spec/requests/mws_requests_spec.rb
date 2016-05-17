require 'rails_helper'

RSpec.describe "MwsRequests", type: :request do
  describe "GET /mws_requests" do
    it "works! (now write some real specs)" do
      get mws_requests_path
      expect(response).to have_http_status(200)
    end
  end
end
