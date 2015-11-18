class RemoveMedicinesFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :medicines, :text
  end
end
