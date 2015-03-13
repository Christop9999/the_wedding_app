require 'spec_helper'

describe "weddings/show" do
  before(:each) do
    @wedding = assign(:wedding, stub_model(Wedding,
      :name => "Name",
      :bride => "Bride",
      :groom => "Groom"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Bride/)
    rendered.should match(/Groom/)
  end
end
