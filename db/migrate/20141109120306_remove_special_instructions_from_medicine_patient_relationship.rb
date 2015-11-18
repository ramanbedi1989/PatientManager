class RemoveSpecialInstructionsFromMedicinePatientRelationship < ActiveRecord::Migration
  def change
    remove_column :medicine_patient_relationships, :special_instruction_id, :integer
  end
end
