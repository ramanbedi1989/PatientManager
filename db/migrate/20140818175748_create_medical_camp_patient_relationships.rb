class CreateMedicalCampPatientRelationships < ActiveRecord::Migration
  def change
    create_table :medical_camp_patient_relationships do |t|
      t.integer :medical_camp_id
      t.integer :patient_id

      t.timestamps
    end
  end
end
