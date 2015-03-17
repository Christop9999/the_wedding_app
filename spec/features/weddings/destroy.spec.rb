require 'spec_helper'

describe "Deleting weddings" do
	let!(:wedding) {Wedding.create(name: "WeddingName", bride: "BrideName", groom: "GroomName")}


it "is successful when deleting wedding" do
	visit "/weddings"
	within"#wedding_#{wedding.id}" do
		click_link "Destroy"
	end
	expect(page).to_not have_content(wedding.name)
	expect(wedding.count).to eq(0)

end
end
