class CreateReminders < ActiveRecord::Migration[7.1]
  def change
    create_table :reminders do |t|
      t.references :treatment, null: false, foreign_key: true
      t.datetime :starting_at
      t.datetime :ending_at
      t.string :frequency
      t.datetime :next_at

      t.timestamps
    end
  end
end
