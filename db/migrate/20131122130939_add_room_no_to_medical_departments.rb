class AddRoomNoToMedicalDepartments < ActiveRecord::Migration
  def change
    add_column :medical_departments, :room_no, :string
  end
end
