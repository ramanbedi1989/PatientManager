class AddDefaultColumnsToMedicines < ActiveRecord::Migration
  def change
    add_column :medicines, :default_dossage_quantity, :integer
    add_column :medicines, :dossage_type_id, :integer
    add_column :medicines, :default_frequency, :integer
    add_column :medicines, :frequency_type_id, :integer
    add_column :medicines, :default_days_taken, :integer
  end
end
