require "rails_helper"

RSpec.describe DiaryEntriesController, :type => :controller do
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

    it "loads the created diary entry" do
      diary_entry = FactoryGirl.create(:diary_entry)
      get :index

      expect(diary_entry.amount).to eq 123
    end

    it "test destory a diary entry" do
      diary_entry = FactoryGirl.create(:diary_entry)
      delete :destroy, id: diary_entry.id
      expect(response).not_to be_success
    end

    it "should be able to sort the diary" do
      diary_entry = FactoryGirl.create(:diary_entry)
      get :sort, field: :food
      expect(response).to be_success
    end

    it "should be able to download the diary" do
      diary_entry = FactoryGirl.create(:diary_entry)
      post :download
      expect(response).to be_success
    end

  end
end