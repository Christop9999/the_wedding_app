require 'spec_helper'

describe "contents/edit" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :wedding => nil
    ))
  end

  it "renders the edit content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", content_path(@content), "post" do
      assert_select "input#content_wedding[name=?]", "content[wedding]"
    end
  end
end
