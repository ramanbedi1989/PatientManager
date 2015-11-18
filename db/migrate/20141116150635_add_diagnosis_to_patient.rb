class AddDiagnosisToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :diagnosis, :text
  end
end
