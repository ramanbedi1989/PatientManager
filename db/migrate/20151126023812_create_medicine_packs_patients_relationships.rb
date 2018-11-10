class CreateMedicinePacksPatientsRelationships < ActiveRecord::Migration
  def change
    create_table :medicine_packs_patients_relationships do |t|
      t.integer :patient_id
      t.integer :medicine_pack_id
      t.integer :default_days
      t.integer :medical_camp_id
      t.string :name

      t.timestamps
    end
  end
end
