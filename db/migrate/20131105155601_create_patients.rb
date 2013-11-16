class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :gender
      t.integer :age
      t.datetime :date
      t.text :address

      t.timestamps
    end
  end
end
