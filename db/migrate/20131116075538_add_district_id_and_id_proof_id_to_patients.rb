class AddDistrictIdAndIdProofIdToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :id_proof_id, :integer
    add_column :patients, :district_id, :integer
  end
end
