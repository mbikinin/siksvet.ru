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

ActiveRecord::Schema.define(:version => 20121015182407) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "declarations", :force => true do |t|
    t.string   "title"
    t.text     "anounce"
    t.text     "text"
    t.string   "img_file_name"
    t.string   "file"
    t.boolean  "is_active"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "objects_id"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.text     "text"
    t.string   "comment"
    t.string   "section"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "main_menus", :force => true do |t|
    t.string   "title"
    t.string   "sort"
    t.boolean  "on_main",    :default => true
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "objects", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "address"
    t.string   "floors"
    t.integer  "floors_int"
    t.string   "phone"
    t.string   "img_file_name"
    t.string   "img_floor_file_name"
    t.string   "date_finish"
    t.string   "longitude"
    t.string   "latitude"
    t.boolean  "is_active"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.string   "uri",         :limit => 50
    t.string   "description", :limit => 500
    t.text     "text"
    t.boolean  "is_active",                  :default => true
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.boolean  "on_menu",                    :default => true
  end

  create_table "partners", :force => true do |t|
    t.string   "title"
    t.string   "img_file_name"
    t.text     "description"
    t.text     "contacts"
    t.boolean  "on_main",       :default => true
    t.boolean  "is_active",     :default => true
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
  end

  create_table "photos", :force => true do |t|
    t.integer  "objects_id"
    t.string   "img_file_name"
    t.integer  "carma",         :default => 0
    t.integer  "views",         :default => 0
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "title"
    t.integer  "objects_id"
    t.text     "description"
    t.integer  "floor"
    t.string   "img_file_name"
    t.boolean  "is_active"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "rich_rich_files", :force => true do |t|
    t.datetime "created_at",                                 :null => false
    t.datetime "updated_at",                                 :null => false
    t.string   "rich_file_file_name"
    t.string   "rich_file_content_type"
    t.integer  "rich_file_file_size"
    t.datetime "rich_file_updated_at"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.text     "uri_cache"
    t.string   "simplified_type",        :default => "file"
  end

  create_table "rooms", :force => true do |t|
    t.string   "title"
    t.integer  "objects_id"
    t.integer  "plan_id"
    t.integer  "number_room"
    t.integer  "count_rooms"
    t.string   "area_all"
    t.string   "area_living_room"
    t.string   "area_kitchen"
    t.string   "area_room_1"
    t.string   "area_room_2"
    t.string   "area_room_3"
    t.string   "area_room_4"
    t.string   "area_wc_room"
    t.string   "area_bathroom_room"
    t.string   "area_loggia"
    t.text     "description"
    t.string   "img_file_name"
    t.boolean  "is_active"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "number_floor"
  end

  create_table "tinymce_images", :force => true do |t|
    t.string   "file_file_name"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

end
