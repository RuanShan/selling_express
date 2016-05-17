require 'rails_helper'

RSpec.describe "mws_requests/show", type: :view do
  before(:each) do
    @mws_request = assign(:mws_request, MwsRequest.create!(
      :amazon_request_id => "Amazon Request",
      :request_type => "Request Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Amazon Request/)
    expect(rendered).to match(/Request Type/)
  end
end
