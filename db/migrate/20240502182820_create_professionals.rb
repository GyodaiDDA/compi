class CreateProfessionals < ActiveRecord::Migration[7.1]
  def change
    create_table :professionals do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :specialty
      t.string :full_name
      t.string :crm
      t.integer :crm_uf
      t.string :cpf
      t.string :phone

      t.timestamps
    end
  end
end
