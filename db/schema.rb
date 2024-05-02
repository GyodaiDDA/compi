# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 20_240_502_190_511) do
  create_table 'medications', force: :cascade do |t|
    t.string 'commercial_name'
    t.string 'substance'
    t.string 'packing'
    t.string 'concentration'
    t.string 'unit'
    t.string 'laboratory'
    t.string 'register_number'
    t.string 'reference_name'
    t.string 'receit_notification'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'patients', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.string 'cid'
    t.string 'full_name'
    t.string 'cpf'
    t.string 'phone'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_patients_on_user_id'
  end

  create_table 'prescriptions', force: :cascade do |t|
    t.integer 'patient_id', null: false
    t.integer 'professional_id', null: false
    t.date 'issue_date'
    t.date 'expiration_date'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['patient_id'], name: 'index_prescriptions_on_patient_id'
    t.index ['professional_id'], name: 'index_prescriptions_on_professional_id'
  end

  create_table 'professionals', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'specialty'
    t.string 'full_name'
    t.string 'crm'
    t.integer 'crm_uf'
    t.string 'cpf'
    t.string 'phone'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_professionals_on_user_id'
  end

  create_table 'reminders', force: :cascade do |t|
    t.integer 'treatment_id', null: false
    t.datetime 'starting_at'
    t.datetime 'ending_at'
    t.string 'frequency'
    t.datetime 'next_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['treatment_id'], name: 'index_reminders_on_treatment_id'
  end

  create_table 'reports', force: :cascade do |t|
    t.integer 'reminder_id', null: false
    t.datetime 'check_in'
    t.string 'result'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['reminder_id'], name: 'index_reports_on_reminder_id'
  end

  create_table 'stashes', force: :cascade do |t|
    t.integer 'medication_id', null: false
    t.integer 'patient_id', null: false
    t.integer 'quantity'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['medication_id'], name: 'index_stashes_on_medication_id'
    t.index ['patient_id'], name: 'index_stashes_on_patient_id'
  end

  create_table 'treatments', force: :cascade do |t|
    t.integer 'prescription_id', null: false
    t.string 'item'
    t.integer 'quantity'
    t.integer 'unit'
    t.string 'frequency'
    t.date 'first_intake'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['prescription_id'], name: 'index_treatments_on_prescription_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'patients', 'users'
  add_foreign_key 'prescriptions', 'patients'
  add_foreign_key 'prescriptions', 'professionals'
  add_foreign_key 'professionals', 'users'
  add_foreign_key 'reminders', 'treatments'
  add_foreign_key 'reports', 'reminders'
  add_foreign_key 'stashes', 'medications'
  add_foreign_key 'stashes', 'patients'
  add_foreign_key 'treatments', 'prescriptions'
end
