require "rails_helper"

RSpec.describe FoodsController, :type => :controller do
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

    it "loads the created foods" do
      food = FactoryGirl.create(:food)
      get :index

      expect(food.name).to eq "Oreo"
    end

    it "test destory the food" do
      food = FactoryGirl.create(:food)
      delete :destroy, id: food.id
      expect(response).not_to be_success
    end

    it "should be able to search the food" do
      food = FactoryGirl.create(:food)
      get :search, search: "Oreo"
      expect(response).to be_success
    end

  end
end