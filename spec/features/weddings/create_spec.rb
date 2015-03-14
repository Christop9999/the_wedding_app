require 'spec_helper'

describe "Creating weddings" do 
	it "redirects to the wedding index page on success" do
		visit "/weddings"
		click_link "New Wedding"
		expect(page).to have_content "New wedding"
		
		fill_in "Name", with: "WeddingName"
		fill_in "Bride", with: "BrideName"
		fill_in "Groom", with: "GroomName"
		select '2015', :from => 'wedding[date(1i)]'
		select 'March', :from => 'wedding[date(2i)]'
		select '14', :from => 'wedding[date(3i)]'
		
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

		select '2015', :from => 'wedding[date(1i)]'
		select 'March', :from => 'wedding[date(2i)]'
		select '14', :from => 'wedding[date(3i)]'
		
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

		select '2015', :from => 'wedding[date(1i)]'
		select 'March', :from => 'wedding[date(2i)]'
		select '14', :from => 'wedding[date(3i)]'
		
		click_button "Create Wedding"

		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end

	it "displays an error when the bride has no name" do
		expect(Wedding.count).to eq(0)

		visit "/weddings"
		click_link "New Wedding"
		expect(page).to have_content ("New wedding")
		
		fill_in "Name", with: "Wedding"
		fill_in "Bride", with: ""
		fill_in "Groom", with: "GroomName"

		select '2015', :from => 'wedding[date(1i)]'
		select 'March', :from => 'wedding[date(2i)]'
		select '14', :from => 'wedding[date(3i)]'
		
		click_button "Create Wedding"

		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end

	it "displays an error when the Brides name has less than 3 characters" do
		expect(Wedding.count).to eq(0)

		visit "/weddings"
		click_link "New Wedding"
		expect(page).to have_content ("New wedding")
		
		fill_in "Name", with: "Wedding"
		fill_in "Bride", with: "B"
		fill_in "Groom", with: "GroomName"

		select '2015', :from => 'wedding[date(1i)]'
		select 'March', :from => 'wedding[date(2i)]'
		select '14', :from => 'wedding[date(3i)]'
		
		click_button "Create Wedding"

		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end

	it "displays an error when the groom has no name" do
		expect(Wedding.count).to eq(0)

		visit "/weddings"
		click_link "New Wedding"
		expect(page).to have_content ("New wedding")
		
		fill_in "Name", with: "Wedding"
		fill_in "Bride", with: "BrideName"
		fill_in "Groom", with: ""

		select '2015', :from => 'wedding[date(1i)]'
		select 'March', :from => 'wedding[date(2i)]'
		select '14', :from => 'wedding[date(3i)]'
		
		click_button "Create Wedding"

		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end

	it "displays an error when the groom name has less than 3 characters" do
		expect(Wedding.count).to eq(0)

		visit "/weddings"
		click_link "New Wedding"
		expect(page).to have_content ("New wedding")
		
		fill_in "Name", with: "Wedding"
		fill_in "Bride", with: "BrideName"
		fill_in "Groom", with: "G"

		select '2015', :from => 'wedding[date(1i)]'
		select 'March', :from => 'wedding[date(2i)]'
		select '14', :from => 'wedding[date(3i)]'
		
		click_button "Create Wedding"

		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end


end
