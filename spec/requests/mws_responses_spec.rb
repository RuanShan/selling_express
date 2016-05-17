require 'rails_helper'

RSpec.describe "MwsResponses", type: :request do
  describe "GET /aws_responses" do
    it "works! (now write some real specs)" do
      get aws_responses_path
      expect(response).to have_http_status(200)
    end
  end
end
