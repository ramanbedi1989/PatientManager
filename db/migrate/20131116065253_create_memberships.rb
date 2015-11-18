class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.integer :patient_id
      t.integer :medical_department_id
      t.datetime :created_at

      t.timestamps
    end
  end
end
