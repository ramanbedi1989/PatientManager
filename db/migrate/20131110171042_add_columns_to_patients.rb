class AddColumnsToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :id_proof_name, :string
    add_column :patients, :id_proof_number, :string
    add_column :patients, :mobile, :string
    add_column :patients, :father_spouse, :string
    add_column :patients, :district, :string
    add_column :patients, :medical_speciality, :string
  end
end
