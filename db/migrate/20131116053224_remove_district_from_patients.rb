class RemoveDistrictFromPatients < ActiveRecord::Migration
  def up
    remove_column :patients, :district
  end

  def down
    add_column :patients, :district, :string
  end
end
