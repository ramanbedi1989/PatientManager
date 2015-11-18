require 'test_helper'

class MedicalCampsControllerTest < ActionController::TestCase
  setup do
    @medical_camp = medical_camps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_camps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_camp" do
    assert_difference('MedicalCamp.count') do
      post :create, medical_camp: { name: @medical_camp.name }
    end

    assert_redirected_to medical_camp_path(assigns(:medical_camp))
  end

  test "should show medical_camp" do
    get :show, id: @medical_camp
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medical_camp
    assert_response :success
  end

  test "should update medical_camp" do
    put :update, id: @medical_camp, medical_camp: { name: @medical_camp.name }
    assert_redirected_to medical_camp_path(assigns(:medical_camp))
  end

  test "should destroy medical_camp" do
    assert_difference('MedicalCamp.count', -1) do
      delete :destroy, id: @medical_camp
    end

    assert_redirected_to medical_camps_path
  end
end
