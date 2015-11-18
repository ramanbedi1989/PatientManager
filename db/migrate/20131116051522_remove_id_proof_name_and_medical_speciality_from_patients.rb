class RemoveIdProofNameAndMedicalSpecialityFromPatients < ActiveRecord::Migration
  def up
    remove_column :patients, :id_proof_name
    remove_column :patients, :medical_speciality
  end

  def down
    add_column :patients, :medical_speciality, :string
    add_column :patients, :id_proof_name, :string
  end
end
