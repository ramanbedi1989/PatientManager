require 'test_helper'

class MedicineTypesControllerTest < ActionController::TestCase
  setup do
    @medicine_type = medicine_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicine_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicine_type" do
    assert_difference('MedicineType.count') do
      post :create, medicine_type: { name: @medicine_type.name }
    end

    assert_redirected_to medicine_type_path(assigns(:medicine_type))
  end

  test "should show medicine_type" do
    get :show, id: @medicine_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicine_type
    assert_response :success
  end

  test "should update medicine_type" do
    put :update, id: @medicine_type, medicine_type: { name: @medicine_type.name }
    assert_redirected_to medicine_type_path(assigns(:medicine_type))
  end

  test "should destroy medicine_type" do
    assert_difference('MedicineType.count', -1) do
      delete :destroy, id: @medicine_type
    end

    assert_redirected_to medicine_types_path
  end
end
