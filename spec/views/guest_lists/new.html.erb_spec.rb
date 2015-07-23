require 'spec_helper'

describe "guest_lists/new" do
  before(:each) do
    assign(:guest_list, stub_model(GuestList,
      :wedding => nil
    ).as_new_record)
  end

  it "renders new guest_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", guest_lists_path, "post" do
      assert_select "input#guest_list_wedding[name=?]", "guest_list[wedding]"
    end
  end
end
