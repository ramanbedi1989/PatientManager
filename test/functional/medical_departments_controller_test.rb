require 'test_helper'

class MedicalDepartmentsControllerTest < ActionController::TestCase
  setup do
    @medical_department = medical_departments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medical_departments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medical_department" do
    assert_difference('MedicalDepartment.count') do
      post :create, medical_department: { medical_department: @medical_department.medical_department }
    end

    assert_redirected_to medical_department_path(assigns(:medical_department))
  end

  test "should show medical_department" do
    get :show, id: @medical_department
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medical_department
    assert_response :success
  end

  test "should update medical_department" do
    put :update, id: @medical_department, medical_department: { medical_department: @medical_department.medical_department }
    assert_redirected_to medical_department_path(assigns(:medical_department))
  end

  test "should destroy medical_department" do
    assert_difference('MedicalDepartment.count', -1) do
      delete :destroy, id: @medical_department
    end

    assert_redirected_to medical_departments_path
  end
end
