class RenameIdproofToName < ActiveRecord::Migration
  def change
  	rename_column :id_proofs, :id_proof, :name
  end
end
