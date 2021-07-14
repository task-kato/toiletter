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

ActiveRecord::Schema.define(version: 2021_07_12_235659) do

  create_table "staffs", charset: "utf8mb3", force: :cascade do |t|
    t.string "nick_name", null: false, comment: "ニックネーム"
    t.integer "gender", default: 1, null: false, comment: "0: 男性, 1: 女性"
    t.string "email", null: false, comment: "メールアドレス"
    t.string "hashed_password", comment: "パスワード"
    t.boolean "suspended", default: false, null: false, comment: "停止フラグ"
    t.boolean "admin", default: false, null: false, comment: "管理者権限"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_staffs_on_email", unique: true
  end

  create_table "toilets", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false, comment: "場所の名前"
    t.string "address", comment: "住所"
    t.float "latitude", comment: "緯度"
    t.float "longitude", comment: "経度"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "nick_name", null: false, comment: "ニックネーム"
    t.integer "gender", default: 1, null: false, comment: "0: 男性, 1: 女性"
    t.string "email", null: false, comment: "メールアドレス"
    t.string "hashed_password", comment: "パスワード"
    t.boolean "suspended", default: false, null: false, comment: "停止フラグ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
