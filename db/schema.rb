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

ActiveRecord::Schema.define(:version => 20120628193233) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "topic_group_id"
    t.boolean  "manager",        :default => false
    t.boolean  "participating",  :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "authentications", :force => true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.boolean  "active",          :default => true
    t.boolean  "never_expires",   :default => false
    t.date     "expiration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo"
  end

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "element_attribute_options", :force => true do |t|
    t.string   "name"
    t.integer  "element_attribute_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "element_attribute_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "symbol"
    t.string   "validation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "element_attributes", :force => true do |t|
    t.string   "name"
    t.integer  "element_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "element_attribute_type_id"
  end

  create_table "element_type_options", :force => true do |t|
    t.string   "name"
    t.string   "encoded_value"
    t.integer  "element_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "element_types", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "symbol"
    t.string   "validation"
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
    t.integer  "topic_group_id"
    t.text     "description"
    t.boolean  "mandatory"
    t.integer  "element_type_id"
  end

  create_table "groupings", :force => true do |t|
    t.string   "name"
    t.text     "description"
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
    t.float    "agreement"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "include"
    t.boolean  "new_element"
  end

  create_table "iterations", :force => true do |t|
    t.integer  "num"
    t.float    "consensus"
    t.boolean  "active"
    t.integer  "topic_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "consensus_topic", :default => true
  end

  create_table "ldap_settings", :force => true do |t|
    t.integer  "company_id"
    t.string   "server_address"
    t.integer  "port_number"
    t.string   "user_name"
    t.string   "encrypted_password"
    t.string   "root_node"
    t.string   "account_attribute_name"
    t.string   "group_attribute_name"
    t.string   "group_member_attribute"
    t.string   "group_names"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "validated"
  end

  create_table "libraries", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.text     "description"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "library_objectives", :force => true do |t|
    t.string   "name"
    t.string   "number"
    t.text     "description"
    t.integer  "library_id"
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

  create_table "topic_group_libraries", :force => true do |t|
    t.integer  "library_id"
    t.integer  "topic_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topic_groups", :force => true do |t|
    t.string   "name"
    t.integer  "goal"
    t.boolean  "active",               :default => true
    t.integer  "update_frequency"
    t.integer  "topic_id"
    t.integer  "grouping_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "elements_spreadsheet"
    t.date     "due_date"
    t.integer  "due_days"
  end

  create_table "topic_libraries", :force => true do |t|
    t.integer  "library_id"
    t.integer  "topic_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "status",           :default => 1
    t.integer  "update_frequency"
    t.integer  "due_days"
    t.boolean  "opt_out"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "goal"
    t.integer  "topic_type",       :default => 1
  end

  create_table "user_element_attribute_lists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "element_attribute_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encoded_value"
  end

  create_table "user_lists", :force => true do |t|
    t.integer  "user_id"
    t.integer  "element_id"
    t.integer  "score"
    t.integer  "iteration_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encoded_value"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
    t.string   "encrypted_password"
    t.string   "password_salt"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "encryptor"
    t.string   "pepper"
    t.string   "rpx_identifier"
    t.string   "avatar"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
