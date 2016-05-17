require 'rails_helper'

RSpec.describe "aws_responses/new", type: :view do
  before(:each) do
    assign(:aws_response, MwsResponse.new(
      :amazon_request_id => "MyString",
      :next_token => "MyString",
      :request_type => "MyString",
      :page_num => ""
    ))
  end

  it "renders new aws_response form" do
    render

    assert_select "form[action=?][method=?]", aws_responses_path, "post" do

      assert_select "input#aws_response_amazon_request_id[name=?]", "aws_response[amazon_request_id]"

      assert_select "input#aws_response_next_token[name=?]", "aws_response[next_token]"

      assert_select "input#aws_response_request_type[name=?]", "aws_response[request_type]"

      assert_select "input#aws_response_page_num[name=?]", "aws_response[page_num]"
    end
  end
end
