require 'spec_helper'

describe "guest_lists/index" do
  before(:each) do
    assign(:guest_lists, [
      stub_model(GuestList,
        :wedding => nil
      ),
      stub_model(GuestList,
        :wedding => nil
      )
    ])
  end

  it "renders a list of guest_lists" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
