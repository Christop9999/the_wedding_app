require 'spec_helper'

describe "guest_lists/edit" do
  before(:each) do
    @guest_list = assign(:guest_list, stub_model(GuestList,
      :wedding => nil
    ))
  end

  it "renders the edit guest_list form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", guest_list_path(@guest_list), "post" do
      assert_select "input#guest_list_wedding[name=?]", "guest_list[wedding]"
    end
  end
end
