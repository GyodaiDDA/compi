class CreateMedications < ActiveRecord::Migration[7.1]
  def change
    create_table :medications do |t|
      t.string :commercial_name
      t.string :substance
      t.string :packing
      t.string :concentration
      t.string :unit
      t.string :laboratory
      t.string :register_number
      t.string :reference_name
      t.string :receit_notification

      t.timestamps
    end
  end
end
