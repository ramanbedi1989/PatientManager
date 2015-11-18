class CreateFrequencyTypes < ActiveRecord::Migration
  def change
    create_table :frequency_types do |t|
      t.string :name
      t.string :hindi_name

      t.timestamps
    end
  end
end
