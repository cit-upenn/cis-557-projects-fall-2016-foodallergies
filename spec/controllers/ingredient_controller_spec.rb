require "rails_helper"

RSpec.describe IngredientsController, :type => :controller do
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

    it "loads all of the ingredients" do
      ingredient = FactoryGirl.create(:ingredient)
      get :index

      expect(ingredient.name).to eq "Milk"
    end

    it "update the ingredient" do
      ingredient = FactoryGirl.create(:ingredient)
      put :update, id: ingredient.id, :ingredient => FactoryGirl.attributes_for(:ingredient)
      expect(response).not_to be_success
    end

    it "test destory the ingredient" do
      ingredient = FactoryGirl.create(:ingredient)
      delete :destroy, id: ingredient.id
      expect(response).not_to be_success
    end

  end
end