class RenameMedicalDepartmentToName < ActiveRecord::Migration
  def change
  	rename_column :medical_departments, :medical_department , :name
  end
end
