class CreateMedicalDepartments < ActiveRecord::Migration
  def change
    create_table :medical_departments do |t|
      t.string :medical_department

      t.timestamps
    end
  end
end
