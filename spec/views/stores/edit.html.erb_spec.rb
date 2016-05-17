require 'rails_helper'

RSpec.describe "stores/edit", type: :view do
  before(:each) do
    @store = assign(:store, Store.create!(
      :name => "MyString",
      :store_type => "MyString"
    ))
  end

  it "renders the edit store form" do
    render

    assert_select "form[action=?][method=?]", store_path(@store), "post" do

      assert_select "input#store_name[name=?]", "store[name]"

      assert_select "input#store_store_type[name=?]", "store[store_type]"
    end
  end
end
