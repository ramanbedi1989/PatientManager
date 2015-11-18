require 'test_helper'

class MedicinePatientRelationshipsControllerTest < ActionController::TestCase
  setup do
    @medicine_patient_relationship = medicine_patient_relationships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicine_patient_relationships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicine_patient_relationship" do
    assert_difference('MedicinePatientRelationship.count') do
      post :create, medicine_patient_relationship: { dosage_quantity: @medicine_patient_relationship.dosage_quantity, dossage_type_id: @medicine_patient_relationship.dossage_type_id, frequency: @medicine_patient_relationship.frequency, frequency_type_id: @medicine_patient_relationship.frequency_type_id, medicine_id: @medicine_patient_relationship.medicine_id, patient_id: @medicine_patient_relationship.patient_id, special_instructions_id: @medicine_patient_relationship.special_instructions_id }
    end

    assert_redirected_to medicine_patient_relationship_path(assigns(:medicine_patient_relationship))
  end

  test "should show medicine_patient_relationship" do
    get :show, id: @medicine_patient_relationship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medicine_patient_relationship
    assert_response :success
  end

  test "should update medicine_patient_relationship" do
    put :update, id: @medicine_patient_relationship, medicine_patient_relationship: { dosage_quantity: @medicine_patient_relationship.dosage_quantity, dossage_type_id: @medicine_patient_relationship.dossage_type_id, frequency: @medicine_patient_relationship.frequency, frequency_type_id: @medicine_patient_relationship.frequency_type_id, medicine_id: @medicine_patient_relationship.medicine_id, patient_id: @medicine_patient_relationship.patient_id, special_instructions_id: @medicine_patient_relationship.special_instructions_id }
    assert_redirected_to medicine_patient_relationship_path(assigns(:medicine_patient_relationship))
  end

  test "should destroy medicine_patient_relationship" do
    assert_difference('MedicinePatientRelationship.count', -1) do
      delete :destroy, id: @medicine_patient_relationship
    end

    assert_redirected_to medicine_patient_relationships_path
  end
end
