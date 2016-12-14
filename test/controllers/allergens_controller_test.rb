require 'test_helper'

class AllergensControllerTest < ActionController::TestCase
  #include Devise::TestHelpers

  setup do
  #   @request.env["devise.mapping"] = Devise.mappings[:admin]
  #   sign_in FactoryGirl.create(:admin)
    @allergen = allergens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:allergens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create allergen" do
    assert_difference('Allergen.count') do
      post :create, allergen: { name: @allergen.name }
    end

    assert_redirected_to allergen_path(assigns(:allergen))
  end

  test "should show allergen" do
    get :show, id: @allergen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @allergen
    assert_response :success
  end

  test "should update allergen" do
    patch :update, id: @allergen, allergen: { name: @allergen.name }
    assert_redirected_to allergen_path(assigns(:allergen))
  end

  test "should destroy allergen" do
    assert_difference('Allergen.count', -1) do
      delete :destroy, id: @allergen
    end

    assert_redirected_to allergens_path
  end
end
