require 'spec_helper'

describe "guest_lists/show" do
  before(:each) do
    @guest_list = assign(:guest_list, stub_model(GuestList,
      :wedding => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
  end
end
