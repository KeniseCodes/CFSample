require 'rails_helper'
#require 'controller_helper'

describe UsersController, :type => :controller do

  describe "GET #index" do
    before :each do
      request.env["devise.mapping"] = Devise.mappings[:user]
     #@user = User.create!(email: "me@home.com", password: "watching the telly")
     @user = FactoryGirl.build(:user)
    end

    it "responds successfully with an HTTP 200 status code" do
      sign_in @user
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      sign_in @user
      get :index
      expect(response).to render_template("index")
    end
  end

end
