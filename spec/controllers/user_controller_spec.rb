require "rails_helper"

RSpec.describe UsersController, :type => :controller do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @current_user = @user
    sign_in @user
  end

  it "should have a current_user" do
    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
    expect(subject.current_user).to_not eq(nil)
  end

  it "should get index" do
    # Note, rails 3.x scaffolding may add lines like get :index, {}, valid_session
    # the valid_session overrides the devise login. Remove the valid_session from your specs
    get 'index'
    response.should be_success
  end

  it "should get show" do
    get :show, id: @user
    response.should be_success
  end

  it "should get settings" do
    get :settings
    response.should be_success
  end

end