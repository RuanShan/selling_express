require 'rails_helper'

RSpec.describe "stores/index", type: :view do
  before(:each) do
    assign(:stores, [
      Store.create!(
        :name => "Name",
        :store_type => "Store Type"
      ),
      Store.create!(
        :name => "Name",
        :store_type => "Store Type"
      )
    ])
  end

  it "renders a list of stores" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Store Type".to_s, :count => 2
  end
end
