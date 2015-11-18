class AddMedicalCampIdToMedicinePatientRelationship < ActiveRecord::Migration
  def up
    add_column :medicine_patient_relationships, :medical_camp_id, :integer
  end
  def down
  	remove_column :medicine_patient_relationships, :medical_camp_id
  end
end
