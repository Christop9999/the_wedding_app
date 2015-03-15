require 'spec_helper'

describe "Creating weddings" do 

	def create_wedding (options={})
		options[:name] ||= "WeddingName"
		options[:bride] ||= "BrideName"
		options[:groom] ||= "GroomName"
		options[:year] ||= "2015"
		options[:month] ||= "March"
		options[:day] ||= "14"

		visit "/weddings"
		click_link "New Wedding"
		expect(page).to have_content "New wedding"

		fill_in "Name", with: options[:name]
		fill_in "Bride", with: options[:bride]
		fill_in "Groom", with: options[:groom]
		select options[:year], :from => 'wedding[date(1i)]'
		select options[:month], :from => 'wedding[date(2i)]'
		select options[:day], :from => 'wedding[date(3i)]'

		click_button "Create Wedding"
	
	end

	it "redirects to the wedding index page on success" do
		
		create_wedding
		expect(page).to have_content "Wedding was successfully created"
		
	end

	it "displays an error when the wedding has no name" do
		expect(Wedding.count).to eq(0)
		create_wedding(name: "")

		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end

	it "displays an error when the wedding has less than 3 characters" do
		expect(Wedding.count).to eq(0)

		create_wedding(name: "Hi")

		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end

	it "displays an error when the bride has no name" do
		expect(Wedding.count).to eq(0)

		create_wedding(bride: "")

		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end

	it "displays an error when the Brides name has less than 3 characters" do
		expect(Wedding.count).to eq(0)

		create_wedding(bride: "B")

		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end

	it "displays an error when the groom has no name" do
		expect(Wedding.count).to eq(0)

		create_wedding(groom: "")

		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end

	it "displays an error when the groom name has less than 3 characters" do
		expect(Wedding.count).to eq(0)

		create_wedding(groom: "G")
		expect(page).to have_content ("error")
		expect(Wedding.count).to eq (0)

	end
	

end
