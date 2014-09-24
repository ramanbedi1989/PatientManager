require 'test_helper'

class FrequencyTypesControllerTest < ActionController::TestCase
  setup do
    @frequency_type = frequency_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:frequency_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create frequency_type" do
    assert_difference('FrequencyType.count') do
      post :create, frequency_type: { name: @frequency_type.name }
    end

    assert_redirected_to frequency_type_path(assigns(:frequency_type))
  end

  test "should show frequency_type" do
    get :show, id: @frequency_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @frequency_type
    assert_response :success
  end

  test "should update frequency_type" do
    put :update, id: @frequency_type, frequency_type: { name: @frequency_type.name }
    assert_redirected_to frequency_type_path(assigns(:frequency_type))
  end

  test "should destroy frequency_type" do
    assert_difference('FrequencyType.count', -1) do
      delete :destroy, id: @frequency_type
    end

    assert_redirected_to frequency_types_path
  end
end
