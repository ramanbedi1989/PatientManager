class RemoveColumnsFromPatient < ActiveRecord::Migration
  def change
    remove_column :patients, :treatment, :text
    remove_column :patients, :services, :text
    remove_column :patients, :special_instructions, :text
  end
end
