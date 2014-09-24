class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.integer :medicine_type_id

      t.timestamps
    end
  end
end
