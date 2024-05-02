class RemoveTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :commercial_names
  end
end
