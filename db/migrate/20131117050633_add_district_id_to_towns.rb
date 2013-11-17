class AddDistrictIdToTowns < ActiveRecord::Migration
  def change
    add_column :towns, :district_id, :integer
  end
end
