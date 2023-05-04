# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_03_102449) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comment", id: :integer, default: nil, force: :cascade do |t|
    t.text "text"
    t.date "updatedat"
    t.date "createdat"
    t.integer "authorid"
    t.integer "postid"
  end

  create_table "like", id: :integer, default: nil, force: :cascade do |t|
    t.integer "authorid"
    t.integer "postid"
    t.date "createdat"
    t.date "updatedat"
  end

  create_table "post", id: :integer, default: nil, force: :cascade do |t|
    t.integer "author_id"
    t.text "title"
    t.date "createdat"
    t.date "updatedat"
    t.integer "commentscounter"
    t.integer "likescounter"
    t.text "text"
  end

  create_table "user", id: :integer, default: nil, force: :cascade do |t|
    t.text "name"
    t.text "photo"
    t.text "bio"
    t.date "updatedat"
    t.date "createdat"
    t.integer "postscounter"
  end

  add_foreign_key "comment", "\"user\"", column: "authorid", name: "comment_authorid_fkey", on_delete: :cascade
  add_foreign_key "comment", "post", column: "postid", name: "comment_postid_fkey"
  add_foreign_key "like", "\"user\"", column: "authorid", name: "like_authorid_fkey", on_delete: :cascade
  add_foreign_key "like", "post", column: "postid", name: "like_postid_fkey", on_delete: :cascade
  add_foreign_key "post", "\"user\"", column: "author_id", name: "post_author_id_fkey", on_delete: :cascade
end
