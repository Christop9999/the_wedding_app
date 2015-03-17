require 'spec_helper'

describe "Editing weddings" do 
	let!(:wedding) {Wedding.create(name: "WeddingName", bride: "BrideName", groom: "GroomName")}

	def edit_wedding (options={})
		options[:name] ||= "WeddingName"
		options[:bride] ||= "BrideName"
		options[:groom] ||= "GroomName"
		options[:year] ||= "2015"
		options[:month] ||= "March"
		options[:day] ||= "14"

		wedding = options[:wedding]

		visit "/weddings"
		within	"#wedding_#{wedding.id}" do
		click_link "Edit"
	end
		expect(page).to have_content "Editing wedding"

		fill_in "Name", with: options[:name]
		fill_in "Bride", with: options[:bride]
		fill_in "Groom", with: options[:groom]
		select options[:year], :from => 'wedding[date(1i)]'
		select options[:month], :from => 'wedding[date(2i)]'
		select options[:day], :from => 'wedding[date(3i)]'

		click_button "Update Wedding"
	
	end

	it "updates a todo list successfully with correct informatoin" do
		
		
		edit_wedding wedding: wedding,
					 name: "NewName",
					 bride: "NewBride",
					 groom: "newGroom"
		
			wedding.reload
			
			expect(page).to have_content("Wedding was successfully updated")
			expect(wedding.name).to eq("NewName")
			expect(wedding.bride).to eq("NewBride")
			expect(wedding.groom).to eq("newGroom")

		end

		
		
	it "displays an error when the wedding has no name" do
		
		edit_wedding(wedding: wedding, name: "")
		expect(page).to have_content ("error")
		
	end

	it "displays an error when the wedding has less than 3 characters" do
		
		edit_wedding(wedding: wedding, name: "Hi")
		expect(page).to have_content ("error")
		
	end

	it "displays an error when the bride has no name" do
		
		edit_wedding(wedding: wedding, bride: "")
		expect(page).to have_content ("error")
		
	end

	it "displays an error when the Brides name has less than 3 characters" do
		

		edit_wedding(wedding: wedding, bride: "B")
		expect(page).to have_content ("error")
	end

	it "displays an error when the groom has no name" do
	

		edit_wedding(wedding: wedding, groom: "")

		expect(page).to have_content ("error")
		
	end

	it "displays an error when the groom name has less than 3 characters" do
		
		edit_wedding(wedding: wedding, groom: "G")
		expect(page).to have_content ("error")
		

	end
	

end

