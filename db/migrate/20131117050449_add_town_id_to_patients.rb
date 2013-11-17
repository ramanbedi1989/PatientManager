class AddTownIdToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :town_id, :integer
  end
end
