class CreateDossageTypes < ActiveRecord::Migration
  def change
    create_table :dossage_types do |t|
      t.string :name
      t.string :hindi_name

      t.timestamps
    end
  end
end
