class RenameTownToName < ActiveRecord::Migration
  def change
  	rename_column :towns, :town , :name
  end
end
