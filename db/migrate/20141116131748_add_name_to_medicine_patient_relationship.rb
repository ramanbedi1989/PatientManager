class AddNameToMedicinePatientRelationship < ActiveRecord::Migration
  def change
    add_column :medicine_patient_relationships, :name, :string
  end
end
