require 'test_helper'

class SpecialInstructionsControllerTest < ActionController::TestCase
  setup do
    @special_instruction = special_instructions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:special_instructions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create special_instruction" do
    assert_difference('SpecialInstruction.count') do
      post :create, special_instruction: { name: @special_instruction.name }
    end

    assert_redirected_to special_instruction_path(assigns(:special_instruction))
  end

  test "should show special_instruction" do
    get :show, id: @special_instruction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @special_instruction
    assert_response :success
  end

  test "should update special_instruction" do
    put :update, id: @special_instruction, special_instruction: { name: @special_instruction.name }
    assert_redirected_to special_instruction_path(assigns(:special_instruction))
  end

  test "should destroy special_instruction" do
    assert_difference('SpecialInstruction.count', -1) do
      delete :destroy, id: @special_instruction
    end

    assert_redirected_to special_instructions_path
  end
end
