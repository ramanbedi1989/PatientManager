class AddTreatmentMedicinesServicesSpecialInstructionToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :treatment, :text
    add_column :patients, :medicines, :text
    add_column :patients, :services, :text
    add_column :patients, :special_instructions, :text
  end
end
