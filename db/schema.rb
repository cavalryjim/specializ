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

ActiveRecord::Schema.define(:version => 20110913164831) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_group_id"
    t.boolean  "manager"
    t.boolean  "participating"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.boolean  "never_expires"
    t.date     "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "elements", :force => true do |t|
    t.string   "name"
    t.boolean  "current"
    t.integer  "created_by"
    t.integer  "edited_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupings", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "company_id"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lft"
    t.integer  "rgt"
  end

  create_table "groupings_users", :id => false, :force => true do |t|
    t.integer "grouping_id", :null => false
    t.integer "user_id",     :null => false
  end

  add_index "groupings_users", ["grouping_id", "user_id"], :name => "index_groupings_users_on_grouping_id_and_user_id", :unique => true

  create_table "iteration_lists", :force => true do |t|
    t.integer  "iteration_id"
    t.integer  "element_id"
    t.float    "avg_score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "iterations", :force => true do |t|
    t.integer  "num"
    t.float    "consensus"
    t.boolean  "active"
    t.integer  "topic_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id", :null => false
    t.integer "user_id", :null => false
  end

  add_index "roles_users", ["role_id", "user_id"], :name => "index_roles_users_on_role_id_and_user_id", :unique => true

  create_table "topic_groups", :force => true do |t|
    t.string   "name"
    t.integer  "goal"
    t.boolean  "active"
    t.integer  "update_frequency"
    t.integer  "topic_id"
    t.integer  "grouping_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "status"
    t.integer  "update_frequency"
    t.integer  "due_days"
    t.boolean  "opt_out"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_lists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "element_id"
    t.integer  "score"
    t.integer  "iteration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

end
