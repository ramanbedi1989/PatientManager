class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :district

      t.timestamps
    end
  end
end
