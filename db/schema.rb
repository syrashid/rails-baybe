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

ActiveRecord::Schema.define(version: 2019_08_27_081125) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boxes", force: :cascade do |t|
    t.decimal "expected_price"
    t.string "status"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_boxes_on_user_id"
  end

  create_table "cart_options", force: :cascade do |t|
    t.string "content"
    t.bigint "option_id"
    t.bigint "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_options_on_cart_id"
    t.index ["option_id"], name: "index_cart_options_on_option_id"
  end

  create_table "carts", force: :cascade do |t|
    t.string "paid"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_price_cents", default: 0, null: false
    t.jsonb "payment"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.float "sell_ratio"
    t.float "buy_ratio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string "photolink"
    t.bigint "stock_product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stock_product_id"], name: "index_photos_on_stock_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "price"
    t.string "gender"
    t.integer "age_min"
    t.integer "age_max"
    t.string "brand"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.boolean "public", default: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "content"
    t.integer "rating"
    t.bigint "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_reviews_on_product_id"
  end

  create_table "stock_products", force: :cascade do |t|
    t.string "color"
    t.string "size"
    t.bigint "condition_id"
    t.bigint "cart_id"
    t.bigint "product_id"
    t.bigint "box_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "purchased", default: false
    t.index ["box_id"], name: "index_stock_products_on_box_id"
    t.index ["cart_id"], name: "index_stock_products_on_cart_id"
    t.index ["condition_id"], name: "index_stock_products_on_condition_id"
    t.index ["product_id"], name: "index_stock_products_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "avatar"
    t.string "phone"
    t.string "address"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "boxes", "users"
  add_foreign_key "cart_options", "carts"
  add_foreign_key "cart_options", "options"
  add_foreign_key "carts", "users"
  add_foreign_key "photos", "stock_products"
  add_foreign_key "products", "categories"
  add_foreign_key "reviews", "products"
  add_foreign_key "stock_products", "boxes"
  add_foreign_key "stock_products", "carts"
  add_foreign_key "stock_products", "conditions"
  add_foreign_key "stock_products", "products"
end
