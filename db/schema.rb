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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160111205205) do

  create_table "brain_dump_assignees", force: true do |t|
    t.integer "user_id"
    t.integer "brain_dump_id"
  end

  add_index "brain_dump_assignees", ["brain_dump_id"], name: "index_brain_dump_assignees_on_brain_dump_id", using: :btree
  add_index "brain_dump_assignees", ["user_id"], name: "index_brain_dump_assignees_on_user_id", using: :btree

  create_table "brain_dump_categories", force: true do |t|
    t.string   "name"
    t.integer  "organization_id"
    t.boolean  "done"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "brain_dump_categories", ["organization_id"], name: "index_brain_dump_categories_on_organization_id", using: :btree

  create_table "brain_dump_notes", force: true do |t|
    t.text     "body"
    t.integer  "brain_dump_id"
    t.integer  "user_id"
    t.text     "body_html"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
  end

  add_index "brain_dump_notes", ["brain_dump_id"], name: "index_brain_dump_notes_on_brain_dump_id", using: :btree
  add_index "brain_dump_notes", ["user_id"], name: "index_brain_dump_notes_on_user_id", using: :btree

  create_table "brain_dumps", force: true do |t|
    t.string   "word"
    t.integer  "brain_dump_category_id"
    t.integer  "organization_id"
    t.boolean  "done",                   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.date     "due_date"
  end

  add_index "brain_dumps", ["brain_dump_category_id"], name: "index_brain_dumps_on_brain_dump_category_id", using: :btree
  add_index "brain_dumps", ["organization_id"], name: "index_brain_dumps_on_organization_id", using: :btree

  create_table "organization_members", force: true do |t|
    t.integer  "role"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organization_members", ["organization_id"], name: "index_organization_members_on_organization_id", using: :btree
  add_index "organization_members", ["user_id"], name: "index_organization_members_on_user_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "name"
    t.integer  "org_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
