class CreateMedicinePacks < ActiveRecord::Migration
  def change
    create_table :medicine_packs do |t|
      t.string :name

      t.timestamps
    end
  end
end
