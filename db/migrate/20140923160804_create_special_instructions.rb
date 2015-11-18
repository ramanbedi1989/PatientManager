class CreateSpecialInstructions < ActiveRecord::Migration
  def change
    create_table :special_instructions do |t|
      t.text :name
      t.text :hindi_name

      t.timestamps
    end
  end
end
