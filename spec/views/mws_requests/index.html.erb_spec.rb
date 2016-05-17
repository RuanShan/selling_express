require 'rails_helper'

RSpec.describe "mws_requests/index", type: :view do
  before(:each) do
    assign(:mws_requests, [
      MwsRequest.create!(
        :amazon_request_id => "Amazon Request",
        :request_type => "Request Type"
      ),
      MwsRequest.create!(
        :amazon_request_id => "Amazon Request",
        :request_type => "Request Type"
      )
    ])
  end

  it "renders a list of mws_requests" do
    render
    assert_select "tr>td", :text => "Amazon Request".to_s, :count => 2
    assert_select "tr>td", :text => "Request Type".to_s, :count => 2
  end
end
