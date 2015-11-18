class CreateMedicalCamps < ActiveRecord::Migration
  def change
    create_table :medical_camps do |t|
      t.string :name

      t.timestamps
    end
  end
end
