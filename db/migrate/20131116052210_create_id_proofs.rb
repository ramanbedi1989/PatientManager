class CreateIdProofs < ActiveRecord::Migration
  def change
    create_table :id_proofs do |t|
      t.string :id_proof

      t.timestamps
    end
  end
end
