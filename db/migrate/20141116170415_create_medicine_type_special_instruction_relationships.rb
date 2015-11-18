class CreateMedicineTypeSpecialInstructionRelationships < ActiveRecord::Migration
  def change
    create_table :medicine_type_special_instruction_relationships do |t|
      t.integer :medicine_type_id
      t.integer :special_instruction_id

      t.timestamps
    end
  end
end
