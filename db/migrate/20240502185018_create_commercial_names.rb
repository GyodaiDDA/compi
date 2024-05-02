class CreateCommercialNames < ActiveRecord::Migration[7.1]
  def change
    create_table :commercial_names do |t|
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
