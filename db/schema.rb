# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120301015536) do

  create_table "custom_fields", :force => true do |t|
    t.string   "fieldable_type", :null => false
    t.integer  "fieldable_id",   :null => false
    t.string   "key",            :null => false
    t.integer  "account_id"
    t.string   "string_value"
    t.datetime "date_value"
    t.integer  "currency_value"
    t.integer  "integer_value"
    t.float    "float_value"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "custom_fields", ["account_id", "fieldable_type", "key", "currency_value"], :name => "custom_fields_currency_index"
  add_index "custom_fields", ["account_id", "fieldable_type", "key", "date_value"], :name => "custom_fields_date_index"
  add_index "custom_fields", ["account_id", "fieldable_type", "key", "float_value"], :name => "custom_fields_float_index"
  add_index "custom_fields", ["account_id", "fieldable_type", "key", "integer_value"], :name => "custom_fields_integer_index"
  add_index "custom_fields", ["account_id", "fieldable_type", "key", "string_value"], :name => "custom_fields_string_index"
  add_index "custom_fields", ["fieldable_type", "fieldable_id", "key"], :name => "index_custom_fields_on_fieldable_type_and_fieldable_id_and_key", :unique => true

  create_table "deals", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
