class CreateSmsNumbers < ActiveRecord::Migration
  def change
    create_table :sms_numbers do |t|
      t.string :number
      t.integer :count, default: 0
      t.datetime :last_sent_at

      t.timestamps
    end
  end
end
