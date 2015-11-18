class RenameDistrictToName < ActiveRecord::Migration
  def change
  	rename_column :districts, :district, :name
  end
end
