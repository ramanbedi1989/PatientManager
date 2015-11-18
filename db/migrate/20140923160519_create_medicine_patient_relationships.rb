class CreateMedicinePatientRelationships < ActiveRecord::Migration
  def change
    create_table :medicine_patient_relationships do |t|
      t.integer :medicine_id
      t.integer :patient_id
      t.integer :dosage_quantity
      t.integer :dossage_type_id
      t.integer :frequency
      t.integer :frequency_type_id
      t.integer :special_instruction_id

      t.timestamps
    end
  end
end
