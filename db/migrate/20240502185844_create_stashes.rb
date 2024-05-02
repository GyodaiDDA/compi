class CreateStashes < ActiveRecord::Migration[7.1]
  def change
    create_table :stashes do |t|
      t.references :medication, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
