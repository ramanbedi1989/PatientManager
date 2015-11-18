class AddDaysTakenToMedicinePatientRelationship < ActiveRecord::Migration
  def change
    add_column :medicine_patient_relationships, :days_taken, :integer
  end
end
