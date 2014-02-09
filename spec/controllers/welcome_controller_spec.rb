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

  describe "post#check_status" do
  	it "matches submitted author with saved author" do
  		manuscript = double('Manuscript', code: "AA1001")
  		Manuscript.stub(:find_by_code)
  		post :check_status, {code: "AA1001", author: "Joe Smith"}
  		expect(assigns(:manuscript)).to eq(manuscript)
  	end
  end

end
