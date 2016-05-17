require 'rails_helper'

RSpec.describe "aws_responses/index", type: :view do
  before(:each) do
    assign(:aws_responses, [
      MwsResponse.create!(
        :amazon_request_id => "Amazon Request",
        :next_token => "Next Token",
        :request_type => "Request Type",
        :page_num => ""
      ),
      MwsResponse.create!(
        :amazon_request_id => "Amazon Request",
        :next_token => "Next Token",
        :request_type => "Request Type",
        :page_num => ""
      )
    ])
  end

  it "renders a list of aws_responses" do
    render
    assert_select "tr>td", :text => "Amazon Request".to_s, :count => 2
    assert_select "tr>td", :text => "Next Token".to_s, :count => 2
    assert_select "tr>td", :text => "Request Type".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
