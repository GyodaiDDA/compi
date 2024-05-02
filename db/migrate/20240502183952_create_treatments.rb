class CreateTreatments < ActiveRecord::Migration[7.1]
  def change
    create_table :treatments do |t|
      t.references :prescription, null: false, foreign_key: true
      t.string :item
      t.integer :quantity
      t.integer :unit
      t.string :frequency
      t.date :first_intake

      t.timestamps
    end
  end
end
