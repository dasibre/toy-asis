require 'spec_helper'

describe WelcomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get :status
      response.should be_success
    end
  end

  describe "get#status" do
  	it "renders status form" do
  		get :status
  		expect(response).to render_template(:status)
  	end
  end


  describe "get#check_status when author is found" do
    before :each do
       @manuscript = double("Manuscript")
       Manuscript.should_receive(:find_by_code).with("AA1000").and_return(@manuscript)
       @manuscript.stub(:author_match?).and_return(true)
    end
    it "assigns params author to '@author'" do
      author = "Smith, Jane"
      get :check_status, {code: "AA1000", author: author}
      expect(assigns(:author)).to eq(author)
    end

    it "assigns manuscript to manuscript" do
      get :check_status, {code: "AA1000"}
      expect(assigns(:manuscript)).to eq(@manuscript)
    end

    it "renders results template" do
      get :check_status, {code: "AA1000", author: "Smith, Jane"}
      expect(response).to render_template(:results)
    end
  end
end
