class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.references :reminder, null: false, foreign_key: true
      t.datetime :check_in
      t.string :result

      t.timestamps
    end
  end
end
