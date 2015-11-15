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

ActiveRecord::Schema.define(version: 20151115124631) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority"

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.integer  "link_type",  default: 0, null: false
    t.integer  "spot_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "links", ["link_type"], name: "index_links_on_link_type"
  add_index "links", ["spot_id"], name: "index_links_on_spot_id"

  create_table "spot_infos", force: :cascade do |t|
    t.string   "type"
    t.integer  "value"
    t.text     "detail"
    t.boolean  "official"
    t.integer  "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "spot_infos", ["spot_id"], name: "index_spot_infos_on_spot_id"
  add_index "spot_infos", ["type"], name: "index_spot_infos_on_type"
  add_index "spot_infos", ["value"], name: "index_spot_infos_on_value"

  create_table "spots", force: :cascade do |t|
    t.string   "name"
    t.integer  "status",            default: 0, null: false
    t.text     "address"
    t.string   "tel"
    t.integer  "lat"
    t.integer  "lng"
    t.integer  "powersupply_score", default: 0
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "spots", ["lat"], name: "index_spots_on_lat"
  add_index "spots", ["lng"], name: "index_spots_on_lng"
  add_index "spots", ["powersupply_score"], name: "index_spots_on_powersupply_score"
  add_index "spots", ["status"], name: "index_spots_on_status"

  create_table "spots_tags", id: false, force: :cascade do |t|
    t.integer "spot_id"
    t.integer "tag_id"
  end

  add_index "spots_tags", ["spot_id"], name: "index_spots_tags_on_spot_id"
  add_index "spots_tags", ["tag_id"], name: "index_spots_tags_on_tag_id"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.string   "image"
    t.integer  "sprite_pos"
    t.text     "detail"
    t.integer  "importance", default: 0
    t.integer  "parent_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "tags", ["importance"], name: "index_tags_on_importance"
  add_index "tags", ["parent_id"], name: "index_tags_on_parent_id"
  add_index "tags", ["type"], name: "index_tags_on_type"

  create_table "users", force: :cascade do |t|
    t.string   "name",                   default: "",    null: false
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
