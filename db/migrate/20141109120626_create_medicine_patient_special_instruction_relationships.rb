class CreateMedicinePatientSpecialInstructionRelationships < ActiveRecord::Migration
  def change
    create_table :medicine_patient_special_instruction_relationships do |t|
      t.integer :medicine_patient_relationship_id
      t.integer :special_instruction_id

      t.timestamps
    end
  end
end
