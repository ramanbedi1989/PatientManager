class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :patients, :name
  	add_index :medicines, :name
  	add_index :towns, :name
  end
end
