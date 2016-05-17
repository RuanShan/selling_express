require 'rails_helper'

RSpec.describe "aws_responses/edit", type: :view do
  before(:each) do
    @aws_response = assign(:aws_response, MwsResponse.create!(
      :amazon_request_id => "MyString",
      :next_token => "MyString",
      :request_type => "MyString",
      :page_num => ""
    ))
  end

  it "renders the edit aws_response form" do
    render

    assert_select "form[action=?][method=?]", aws_response_path(@aws_response), "post" do

      assert_select "input#aws_response_amazon_request_id[name=?]", "aws_response[amazon_request_id]"

      assert_select "input#aws_response_next_token[name=?]", "aws_response[next_token]"

      assert_select "input#aws_response_request_type[name=?]", "aws_response[request_type]"

      assert_select "input#aws_response_page_num[name=?]", "aws_response[page_num]"
    end
  end
end
