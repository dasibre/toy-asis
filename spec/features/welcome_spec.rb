require 'spec_helper'
require 'pry'

describe "welcome" do
	let(:valid_attributes) do
      Hash[code: 'AA1001', title: 'some title', status: 'NEW', :status_date => Date.today]
    end
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

		describe "results view" do
			before :each do
				@author = "Smith, Jane"
				@manuscript = Manuscript.create!(valid_attributes)
        		@manuscript.authors << Author.new(publish_name: @author)
				fill_in "code",  with: "AA1001"
				fill_in "author", with: @author
				click_button "Check Status"
			end
			it "should display manuscript title", :js => true do
				expect(page).to have_content(@author)
				expect(page).to have_content('some title')
				expect(page).to have_content('NEW')
			end
		end
	end
end