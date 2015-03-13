require 'spec_helper'

describe "weddings/index" do
  before(:each) do
    assign(:weddings, [
      stub_model(Wedding,
        :name => "Name",
        :bride => "Bride",
        :groom => "Groom"
      ),
      stub_model(Wedding,
        :name => "Name",
        :bride => "Bride",
        :groom => "Groom"
      )
    ])
  end

  it "renders a list of weddings" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Bride".to_s, :count => 2
    assert_select "tr>td", :text => "Groom".to_s, :count => 2
  end
end
