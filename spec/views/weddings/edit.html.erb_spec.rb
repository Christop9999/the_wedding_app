require 'spec_helper'

describe "weddings/edit" do
  before(:each) do
    @wedding = assign(:wedding, stub_model(Wedding,
      :name => "MyString",
      :bride => "MyString",
      :groom => "MyString"
    ))
  end

  it "renders the edit wedding form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", wedding_path(@wedding), "post" do
      assert_select "input#wedding_name[name=?]", "wedding[name]"
      assert_select "input#wedding_bride[name=?]", "wedding[bride]"
      assert_select "input#wedding_groom[name=?]", "wedding[groom]"
    end
  end
end
