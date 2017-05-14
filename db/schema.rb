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

ActiveRecord::Schema.define(version: 20170427053753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "links", force: :cascade do |t|
    t.string   "url"
    t.integer  "link_type",  default: 0, null: false
    t.integer  "spot_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["link_type"], name: "index_links_on_link_type", using: :btree
    t.index ["spot_id"], name: "index_links_on_spot_id", using: :btree
  end

  create_table "spot_infos", force: :cascade do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "value"
    t.text     "detail"
    t.boolean  "official"
    t.integer  "spot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["spot_id"], name: "index_spot_infos_on_spot_id", using: :btree
    t.index ["type"], name: "index_spot_infos_on_type", using: :btree
    t.index ["value"], name: "index_spot_infos_on_value", using: :btree
  end

  create_table "spots", force: :cascade do |t|
    t.string    "name"
    t.integer   "status",                                                                        default: 0, null: false
    t.text      "address"
    t.string    "tel"
    t.integer   "powersupply_score",                                                             default: 0
    t.integer   "ee_id"
    t.integer   "ee_url_title"
    t.datetime  "created_at",                                                                                null: false
    t.datetime  "updated_at",                                                                                null: false
    t.geography "lonlat",            limit: {:srid=>4326, :type=>"st_point", :geographic=>true}
    t.index ["lonlat"], name: "index_spots_on_lonlat", using: :gist
    t.index ["powersupply_score"], name: "index_spots_on_powersupply_score", using: :btree
    t.index ["status"], name: "index_spots_on_status", using: :btree
  end

  create_table "spots_tags", id: false, force: :cascade do |t|
    t.integer "spot_id"
    t.integer "tag_id"
    t.index ["spot_id"], name: "index_spots_tags_on_spot_id", using: :btree
    t.index ["tag_id"], name: "index_spots_tags_on_tag_id", using: :btree
  end

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
    t.index ["importance"], name: "index_tags_on_importance", using: :btree
    t.index ["parent_id"], name: "index_tags_on_parent_id", using: :btree
    t.index ["type"], name: "index_tags_on_type", using: :btree
  end

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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "links", "spots"
  add_foreign_key "spot_infos", "spots"
  add_foreign_key "spots_tags", "spots"
  add_foreign_key "spots_tags", "tags"
end
