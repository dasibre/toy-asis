require 'spec_helper'

describe Manuscript do
	let(:valid_attributes) do
      Hash[code: 'AA1001', title: 'some title', status: 'NEW', :status_date => Date.today]
    end

	describe 'persistence' do
	  it 'creates with valid attributes' do
	    Manuscript.create!(valid_attributes)
	  end
	end

    describe 'manuscript status query' do
  	  before :each do
  	   	@manuscript = Manuscript.create!(valid_attributes)
  		  @manuscript.authors << Author.new(publish_name: 'Li,John')
  		  @exitent_author_params = "li"
  		  @nonexitent_author_params = "Witherspoon"
  	  end
      describe '#get authors' do
        it "should get all manuscript authors" do
  	      expect(@manuscript.get_authors).to eq(@manuscript.authors)
        end
      end

      describe "#author_match?" do
        it "should be true with valid author" do
  	      expect(@manuscript.author_match?(@exitent_author_params)).to eq(true)
        end

        it "should ignore white space" do
          expect(@manuscript.author_match?(" Li")).to eq(true)
        end

         it "should be false with invalid author" do
  	      expect(@manuscript.author_match?(@nonexitent_author_params)).to eq(false)
        end
      end
    end
end
