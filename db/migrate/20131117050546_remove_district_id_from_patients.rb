class RemoveDistrictIdFromPatients < ActiveRecord::Migration
  def up
    remove_column :patients, :district_id
  end

  def down
    add_column :patients, :district_id, :integer
  end
end
