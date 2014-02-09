require 'spec_helper'

describe "welcome" do
	describe "index view" do
		it "shows view manuscript status link" do
			visit root_path
			page.should have_link("View Manuscript Status")
		end
	end

	describe "manuscript status view" do
		before :each do
			visit root_path
			click_link "View Manuscript Status"
		end
		it "display status form fields" do
			expect(page).to have_content("Manuscript Status")
		end
	end
end