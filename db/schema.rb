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

ActiveRecord::Schema.define(:version => 20101006041050) do

  create_table "entries", :force => true do |t|
    t.integer  "user_id"
    t.integer  "approver_id"
    t.string   "tb_class"
    t.string   "category"
    t.float    "rt"
    t.float    "sixty"
    t.float    "eighth"
    t.float    "eighth_trap"
    t.float    "thousand_foot"
    t.float    "et"
    t.float    "trap"
    t.boolean  "nitrous",       :default => false
    t.string   "timeslip_url"
    t.string   "photo_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "model"
    t.string   "car_year"
    t.text     "description"
    t.datetime "raced_at"
  end

  create_table "users", :force => true do |t|
    t.string    "email",                               :default => "",    :null => false
    t.string    "encrypted_password",   :limit => 128, :default => "",    :null => false
    t.string    "password_salt",                       :default => "",    :null => false
    t.string    "reset_password_token"
    t.string    "remember_token"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                       :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.boolean   "admin",                               :default => false
    t.string    "name"
    t.string    "username"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end
