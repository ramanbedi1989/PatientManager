require 'test_helper'

class DossageTypesControllerTest < ActionController::TestCase
  setup do
    @dossage_type = dossage_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dossage_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dossage_type" do
    assert_difference('DossageType.count') do
      post :create, dossage_type: { name: @dossage_type.name }
    end

    assert_redirected_to dossage_type_path(assigns(:dossage_type))
  end

  test "should show dossage_type" do
    get :show, id: @dossage_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dossage_type
    assert_response :success
  end

  test "should update dossage_type" do
    put :update, id: @dossage_type, dossage_type: { name: @dossage_type.name }
    assert_redirected_to dossage_type_path(assigns(:dossage_type))
  end

  test "should destroy dossage_type" do
    assert_difference('DossageType.count', -1) do
      delete :destroy, id: @dossage_type
    end

    assert_redirected_to dossage_types_path
  end
end
