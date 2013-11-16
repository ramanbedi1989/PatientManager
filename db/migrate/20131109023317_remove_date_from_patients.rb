class RemoveDateFromPatients < ActiveRecord::Migration
  def up
    remove_column :patients, :date
  end

  def down
    add_column :patients, :date, :datetime
  end
end
