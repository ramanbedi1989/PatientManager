require 'test_helper'

class IdProofsControllerTest < ActionController::TestCase
  setup do
    @id_proof = id_proofs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:id_proofs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create id_proof" do
    assert_difference('IdProof.count') do
      post :create, id_proof: { id_proof: @id_proof.id_proof }
    end

    assert_redirected_to id_proof_path(assigns(:id_proof))
  end

  test "should show id_proof" do
    get :show, id: @id_proof
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @id_proof
    assert_response :success
  end

  test "should update id_proof" do
    put :update, id: @id_proof, id_proof: { id_proof: @id_proof.id_proof }
    assert_redirected_to id_proof_path(assigns(:id_proof))
  end

  test "should destroy id_proof" do
    assert_difference('IdProof.count', -1) do
      delete :destroy, id: @id_proof
    end

    assert_redirected_to id_proofs_path
  end
end
