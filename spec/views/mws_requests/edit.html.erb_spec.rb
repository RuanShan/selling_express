require 'rails_helper'

RSpec.describe "mws_requests/edit", type: :view do
  before(:each) do
    @mws_request = assign(:mws_request, MwsRequest.create!(
      :amazon_request_id => "MyString",
      :request_type => "MyString"
    ))
  end

  it "renders the edit mws_request form" do
    render

    assert_select "form[action=?][method=?]", mws_request_path(@mws_request), "post" do

      assert_select "input#mws_request_amazon_request_id[name=?]", "mws_request[amazon_request_id]"

      assert_select "input#mws_request_request_type[name=?]", "mws_request[request_type]"
    end
  end
end
