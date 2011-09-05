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

ActiveRecord::Schema.define(:version => 20110904133626) do

  create_table "roles", :force => true do |t|
    t.string   "name",        :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name"], :name => "roles_uq1", :unique => true

  create_table "users", :force => true do |t|
    t.string   "email",          :limit => 50, :null => false
    t.string   "pass",           :limit => 40, :null => false
    t.string   "salt",           :limit => 40, :null => false
    t.string   "activation_key", :limit => 40
    t.string   "state",          :limit => 40, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id",                      :null => false
  end

  add_index "users", ["email"], :name => "users_uq1", :unique => true

end
