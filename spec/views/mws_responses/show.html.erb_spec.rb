require 'rails_helper'

RSpec.describe "aws_responses/show", type: :view do
  before(:each) do
    @aws_response = assign(:aws_response, MwsResponse.create!(
      :amazon_request_id => "Amazon Request",
      :next_token => "Next Token",
      :request_type => "Request Type",
      :page_num => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Amazon Request/)
    expect(rendered).to match(/Next Token/)
    expect(rendered).to match(/Request Type/)
    expect(rendered).to match(//)
  end
end
