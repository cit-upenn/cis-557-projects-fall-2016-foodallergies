require "rails_helper"

RSpec.describe WeightsController, :type => :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @current_user = @user
    sign_in @user
  end

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the weights" do
      weight = FactoryGirl.create(:weight)
      get :index

      expect(weight.weight).to eq 50
    end
  end
end