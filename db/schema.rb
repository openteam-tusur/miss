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

ActiveRecord::Schema.define(:version => 20110322103249) do

  create_table "contests", :force => true do |t|
    t.integer  "year"
    t.boolean  "published"
    t.boolean  "current"
    t.date     "voting_started_on"
    t.date     "voting_finished_on"
    t.text     "sponsors"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "additional"
  end

  create_table "members", :force => true do |t|
    t.string   "slug"
    t.string   "name"
    t.text     "annotation"
    t.text     "content"
    t.string   "nomination"
    t.integer  "position"
    t.integer  "contest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.integer  "member_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "image_fingerprint"
    t.string   "image_large_dimensions"
    t.string   "image_original_dimensions"
    t.string   "image_normal_dimensions"
    t.string   "image_small_dimensions"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "votings", :force => true do |t|
    t.integer  "member_id"
    t.string   "remote_ip"
    t.string   "remote_proxy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
