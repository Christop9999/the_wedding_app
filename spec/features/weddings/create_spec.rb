require 'spec_helper'

describe "Creating weddings" do 
	it "redirects to the wedding index page on success" do
		visit "/weddings"
		click_link "New Wedding"
		expect(page).to have_content "New wedding"
		
		fill_in "Name", with: "WeddingName"
		fill_in "Bride", with: "BrideName"
		fill_in "Groom", with: "GroomName"
		
		click_button "Create Wedding"

		expect(page).to have_content "Wedding was successfully created"

	end

	it "displays an error when the wedding has no name" do
		expect(Wedding.count).to eq(0)

		visit "/weddings"
		click_link "New Wedding"
		expect(page).to have_content ("New wedding")
		
		fill_in "Name", with: ""
		fill_in "Bride", with: "BrideName"
		fill_in "Groom", with: "GroomName"
		
		click_button "Create Wedding"

		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end

	it "displays an error when the wedding has less than 3 characters" do
		expect(Wedding.count).to eq(0)

		visit "/weddings"
		click_link "New Wedding"
		expect(page).to have_content ("New wedding")
		
		fill_in "Name", with: "Hi"
		fill_in "Bride", with: "BrideName"
		fill_in "Groom", with: "GroomName"
		
		click_button "Create Wedding"

		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end


end
