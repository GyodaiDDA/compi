class CreatePrescriptions < ActiveRecord::Migration[7.1]
  def change
    create_table :prescriptions do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: true
      t.date :issue_date
      t.date :expiration_date

      t.timestamps
    end
  end
end
