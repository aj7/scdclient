# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100421141432) do

  create_table "name_relationships", :force => true do |t|
    t.integer  "taxon_name_from_id"
    t.integer  "taxon_name_to_id"
    t.datetime "date_enforced"
    t.string   "relationship_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxon_name_relationships", :force => true do |t|
    t.integer  "taxon_name_id"
    t.integer  "name_relationship_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taxon_names", :force => true do |t|
    t.string   "scientific_name"
    t.string   "basionym_authorship"
    t.date     "authorship_year"
    t.integer  "basionym_id"
    t.boolean  "is_usable"
    t.date     "alternative_authorship_year"
    t.string   "genus_part"
    t.string   "epithet"
    t.string   "infra_epithet"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.integer  "login_count",        :default => 0, :null => false
    t.integer  "failed_login_count", :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
