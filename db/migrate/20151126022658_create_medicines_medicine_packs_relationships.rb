class CreateMedicinesMedicinePacksRelationships < ActiveRecord::Migration
  def change
    create_table :medicines_medicine_packs_relationships do |t|
      t.integer :medicine_id
      t.integer :medicine_pack_id
      t.integer :default_days
      t.string :name
      
      t.timestamps
    end
  end
end
