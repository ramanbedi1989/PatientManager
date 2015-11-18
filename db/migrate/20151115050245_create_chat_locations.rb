class CreateChatLocations < ActiveRecord::Migration
  def change
    create_table :chat_locations do |t|
      t.string :name

      t.timestamps
    end
  end
end
