require 'spec_helper'

describe "weddings/new" do
  before(:each) do
    assign(:wedding, stub_model(Wedding,
      :name => "MyString",
      :bride => "MyString",
      :groom => "MyString"
    ).as_new_record)
  end

  it "renders new wedding form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", weddings_path, "post" do
      assert_select "input#wedding_name[name=?]", "wedding[name]"
      assert_select "input#wedding_bride[name=?]", "wedding[bride]"
      assert_select "input#wedding_groom[name=?]", "wedding[groom]"
    end
  end
end
