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

ActiveRecord::Schema.define(version: 20180201205249) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "refinery_authentication_devise_roles", id: :serial, force: :cascade do |t|
    t.string "title"
  end

  create_table "refinery_authentication_devise_roles_users", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id", "user_id"], name: "refinery_roles_users_role_id_user_id"
    t.index ["user_id", "role_id"], name: "refinery_roles_users_user_id_role_id"
  end

  create_table "refinery_authentication_devise_user_plugins", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "position"
    t.index ["name"], name: "index_refinery_authentication_devise_user_plugins_on_name"
    t.index ["user_id", "name"], name: "refinery_user_plugins_user_id_name", unique: true
  end

  create_table "refinery_authentication_devise_users", id: :serial, force: :cascade do |t|
    t.string "username", null: false
    t.string "email", null: false
    t.string "encrypted_password", null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "sign_in_count"
    t.datetime "remember_created_at"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.string "full_name"
    t.index ["id"], name: "index_refinery_authentication_devise_users_on_id"
    t.index ["slug"], name: "index_refinery_authentication_devise_users_on_slug"
  end

  create_table "refinery_image_translations", force: :cascade do |t|
    t.integer "refinery_image_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_alt"
    t.string "image_title"
    t.index ["locale"], name: "index_refinery_image_translations_on_locale"
    t.index ["refinery_image_id"], name: "index_refinery_image_translations_on_refinery_image_id"
  end

  create_table "refinery_images", id: :serial, force: :cascade do |t|
    t.string "image_mime_type"
    t.string "image_name"
    t.integer "image_size"
    t.integer "image_width"
    t.integer "image_height"
    t.string "image_uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_page_part_translations", force: :cascade do |t|
    t.integer "refinery_page_part_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body"
    t.index ["locale"], name: "index_refinery_page_part_translations_on_locale"
    t.index ["refinery_page_part_id"], name: "index_refinery_page_part_translations_on_refinery_page_part_id"
  end

  create_table "refinery_page_parts", id: :serial, force: :cascade do |t|
    t.integer "refinery_page_id"
    t.string "slug"
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "title"
    t.index ["id"], name: "index_refinery_page_parts_on_id"
    t.index ["refinery_page_id"], name: "index_refinery_page_parts_on_refinery_page_id"
  end

  create_table "refinery_page_translations", force: :cascade do |t|
    t.integer "refinery_page_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "custom_slug"
    t.string "menu_title"
    t.string "slug"
    t.index ["locale"], name: "index_refinery_page_translations_on_locale"
    t.index ["refinery_page_id"], name: "index_refinery_page_translations_on_refinery_page_id"
  end

  create_table "refinery_pages", id: :serial, force: :cascade do |t|
    t.integer "parent_id"
    t.string "path"
    t.boolean "show_in_menu", default: true
    t.string "link_url"
    t.string "menu_match"
    t.boolean "deletable", default: true
    t.boolean "draft", default: false
    t.boolean "skip_to_first_child", default: false
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth"
    t.string "view_template"
    t.string "layout_template"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["depth"], name: "index_refinery_pages_on_depth"
    t.index ["id"], name: "index_refinery_pages_on_id"
    t.index ["lft"], name: "index_refinery_pages_on_lft"
    t.index ["parent_id"], name: "index_refinery_pages_on_parent_id"
    t.index ["rgt"], name: "index_refinery_pages_on_rgt"
  end

  create_table "refinery_pv_board_director_translations", force: :cascade do |t|
    t.integer "refinery_pv_board_director_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "position"
    t.text "description"
    t.index ["locale"], name: "index_refinery_pv_board_director_translations_on_locale"
    t.index ["refinery_pv_board_director_id"], name: "index_a62a5fed9370cba15ae037bbd3d3e4430044edee"
  end

  create_table "refinery_pv_board_directors", force: :cascade do |t|
    t.string "name"
    t.string "last_name"
    t.integer "position"
    t.text "description"
    t.string "mail"
    t.string "link"
    t.integer "photo_id"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_pv_bulletin_translations", force: :cascade do |t|
    t.integer "refinery_pv_bulletin_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "content"
    t.index ["locale"], name: "index_refinery_pv_bulletin_translations_on_locale"
    t.index ["refinery_pv_bulletin_id"], name: "index_aa4db12b6d5646e6f918102049a1228abde700b3"
  end

  create_table "refinery_pv_bulletins", force: :cascade do |t|
    t.string "title"
    t.integer "thumbnail_id"
    t.integer "bulletin_image_id"
    t.text "content"
    t.date "creation_date"
    t.boolean "status"
    t.string "associated_link"
    t.integer "refinery_pv_category_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_pv_categories", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "status"
    t.string "type_name"
    t.text "description_type"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_pv_category_translations", force: :cascade do |t|
    t.integer "refinery_pv_category_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "description"
    t.string "type_name"
    t.text "description_type"
    t.index ["locale"], name: "index_refinery_pv_category_translations_on_locale"
    t.index ["refinery_pv_category_id"], name: "index_f72917fd096e371bff291fd301b99bec09dbc25b"
  end

  create_table "refinery_pv_document_translations", force: :cascade do |t|
    t.integer "refinery_pv_document_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_refinery_pv_document_translations_on_locale"
    t.index ["refinery_pv_document_id"], name: "index_96f7fb7df2f773c69246ccc7ea6eb17f13e48d1a"
  end

  create_table "refinery_pv_documents", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "status"
    t.date "creation_date"
    t.integer "file_url_id"
    t.integer "refinery_pv_category_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_pv_faq_translations", force: :cascade do |t|
    t.integer "refinery_pv_faq_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "question"
    t.text "answer"
    t.index ["locale"], name: "index_refinery_pv_faq_translations_on_locale"
    t.index ["refinery_pv_faq_id"], name: "index_refinery_pv_faq_translations_on_refinery_pv_faq_id"
  end

  create_table "refinery_pv_faqs", force: :cascade do |t|
    t.string "title"
    t.text "question"
    t.text "answer"
    t.boolean "status"
    t.integer "refinery_pv_category_id"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_pv_home_main_section_translations", force: :cascade do |t|
    t.integer "refinery_pv_home_main_section_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.text "description"
    t.index ["locale"], name: "index_refinery_pv_home_main_section_translations_on_locale"
    t.index ["refinery_pv_home_main_section_id"], name: "index_929622ad3207f5ed80a9804c59b8c3af63fc4b92"
  end

  create_table "refinery_pv_home_main_sections", force: :cascade do |t|
    t.string "title"
    t.integer "photo_id"
    t.text "description"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_pv_stock_translations", force: :cascade do |t|
    t.integer "refinery_pv_stock_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "ticker"
    t.string "market"
    t.index ["locale"], name: "index_refinery_pv_stock_translations_on_locale"
    t.index ["refinery_pv_stock_id"], name: "index_refinery_pv_stock_translations_on_refinery_pv_stock_id"
  end

  create_table "refinery_pv_stocks", force: :cascade do |t|
    t.string "name"
    t.string "ticker"
    t.string "market"
    t.decimal "min_cor"
    t.decimal "average_cor"
    t.decimal "max_cor"
    t.decimal "min_usd"
    t.decimal "average_usd"
    t.decimal "max_usd"
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "refinery_resource_translations", force: :cascade do |t|
    t.integer "refinery_resource_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "resource_title"
    t.index ["locale"], name: "index_refinery_resource_translations_on_locale"
    t.index ["refinery_resource_id"], name: "index_refinery_resource_translations_on_refinery_resource_id"
  end

  create_table "refinery_resources", id: :serial, force: :cascade do |t|
    t.string "file_mime_type"
    t.string "file_name"
    t.integer "file_size"
    t.string "file_uid"
    t.string "file_ext"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "refinery_settings", id: :serial, force: :cascade do |t|
    t.string "name"
    t.text "value"
    t.boolean "destroyable", default: true
    t.string "scoping"
    t.boolean "restricted", default: false
    t.string "form_value_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "slug"
    t.string "title"
    t.index ["name"], name: "index_refinery_settings_on_name"
  end

  create_table "seo_meta", id: :serial, force: :cascade do |t|
    t.integer "seo_meta_id"
    t.string "seo_meta_type"
    t.string "browser_title"
    t.text "meta_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["id"], name: "index_seo_meta_on_id"
    t.index ["seo_meta_id", "seo_meta_type"], name: "id_type_index_on_seo_meta"
  end

end
