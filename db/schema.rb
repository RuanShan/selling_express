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

ActiveRecord::Schema.define(version: 20160518430129) do

  create_table "brands", force: :cascade do |t|
    t.string   "name"
    t.integer  "vendor_id"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.float    "default_markup",      default: 1.0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "fulfillment_latency"
  end

  add_index "brands", ["vendor_id"], name: "index_brands_on_vendor_id"

  create_table "imports", force: :cascade do |t|
    t.string   "format"
    t.string   "input_file_file_name"
    t.string   "input_file_content_type"
    t.integer  "input_file_file_size"
    t.datetime "input_file_updated_at"
    t.string   "error_file_file_name"
    t.string   "error_file_content_type"
    t.integer  "error_file_file_size"
    t.datetime "error_file_updated_at"
    t.datetime "import_date"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "listings", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "store_id"
    t.string   "handle"
    t.string   "foreign_id"
    t.integer  "mws_request_id"
    t.string   "status"
    t.string   "operation_type"
    t.string   "string"
    t.string   "build_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mws_messages", force: :cascade do |t|
    t.integer  "listing_id"
    t.text     "message"
    t.integer  "matchable_id"
    t.string   "matchable_type"
    t.integer  "variant_image_id"
    t.integer  "feed_type"
    t.string   "result_code"
    t.string   "message_code"
    t.text     "result_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mws_order_items", force: :cascade do |t|
    t.string   "asin"
    t.string   "amazon_order_item_id"
    t.string   "seller_sku"
    t.string   "title"
    t.integer  "quantity_ordered"
    t.integer  "quantity_shipped"
    t.float    "item_price"
    t.string   "item_price_currency"
    t.float    "shipping_price"
    t.string   "shipping_price_currency"
    t.float    "gift_price"
    t.string   "gift_price_currency"
    t.float    "item_tax"
    t.string   "item_tax_currency"
    t.float    "shipping_tax"
    t.string   "shipping_tax_currency"
    t.float    "gift_tax"
    t.string   "gift_tax_currency"
    t.float    "shipping_discount"
    t.string   "shipping_discount_currency"
    t.float    "promotion_discount"
    t.string   "promotion_discount_currency"
    t.string   "gift_wrap_level"
    t.string   "gift_message_text"
    t.integer  "mws_order_id"
    t.integer  "mws_response_id"
    t.string   "amazon_order_id"
    t.string   "clean_sku"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "product_id"
    t.integer  "variant_id"
    t.integer  "sub_variant_id"
  end

  add_index "mws_order_items", ["amazon_order_id"], name: "index_mws_order_items_on_amazon_order_id"
  add_index "mws_order_items", ["clean_sku"], name: "index_mws_order_items_on_clean_sku"
  add_index "mws_order_items", ["mws_order_id"], name: "index_mws_order_items_on_mws_order_id"
  add_index "mws_order_items", ["mws_response_id"], name: "index_mws_order_items_on_mws_response_id"

  create_table "mws_orders", force: :cascade do |t|
    t.integer  "mws_response_id"
    t.integer  "store_id"
    t.string   "name"
    t.string   "amazon_order_id"
    t.string   "seller_order_id"
    t.datetime "purchase_date"
    t.datetime "last_update_date"
    t.string   "order_status"
    t.string   "fulfillment_channel"
    t.string   "sales_channel"
    t.string   "order_channel"
    t.string   "ship_service_level"
    t.float    "amount"
    t.string   "currency_code"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "address_line_3"
    t.string   "city"
    t.string   "county"
    t.string   "district"
    t.string   "state_or_region"
    t.string   "postal_code"
    t.string   "country_code"
    t.string   "phone"
    t.integer  "number_of_items_shipped"
    t.integer  "number_of_items_unshipped"
    t.string   "marketplace_id"
    t.string   "buyer_name"
    t.string   "buyer_email"
    t.string   "shipment_service_level_category"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "mws_orders", ["amazon_order_id"], name: "index_mws_orders_on_amazon_order_id"
  add_index "mws_orders", ["mws_response_id"], name: "index_mws_orders_on_mws_response_id"
  add_index "mws_orders", ["purchase_date"], name: "index_mws_orders_on_purchase_date"
  add_index "mws_orders", ["store_id"], name: "index_mws_orders_on_store_id"

  create_table "mws_requests", force: :cascade do |t|
    t.integer  "mws_request_id"
    t.integer  "store_id"
    t.string   "amazon_request_id"
    t.string   "request_type"
    t.string   "message_type"
    t.string   "feed_submission_id"
    t.string   "processing_status"
    t.datetime "submitted_at"
    t.datetime "started_at"
    t.datetime "completed_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "feed_type"
    t.text     "message"
  end

  add_index "mws_requests", ["mws_request_id"], name: "index_mws_requests_on_mws_request_id"

  create_table "mws_responses", force: :cascade do |t|
    t.integer  "mws_request_id"
    t.string   "amazon_request_id"
    t.string   "next_token"
    t.datetime "last_updated_before"
    t.datetime "created_before"
    t.string   "request_type"
    t.integer  "page_num"
    t.string   "error_code"
    t.text     "error_message"
    t.string   "amazon_order_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "feed_submission_id"
    t.string   "processing_status"
  end

  add_index "mws_responses", ["amazon_order_id"], name: "index_mws_responses_on_amazon_order_id"
  add_index "mws_responses", ["mws_request_id"], name: "index_mws_responses_on_mws_request_id"

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "sku"
    t.text     "description"
    t.datetime "available_on"
    t.datetime "deleted_at"
    t.text     "meta_description"
    t.string   "meta_keywords"
    t.integer  "brand_id"
    t.string   "category"
    t.string   "amazon_name"
    t.string   "amazon_description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_type",                default: "Accessory"
    t.string   "variation_theme",             default: "Color"
    t.string   "department"
    t.datetime "file_date"
    t.string   "amazon_template"
    t.text     "style_keywords"
    t.text     "occasion_lifestyle_keywords"
    t.text     "search_keywords"
    t.text     "bullet_points"
    t.string   "fulfillment_channel"
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id"
  add_index "products", ["category"], name: "index_products_on_category"
  add_index "products", [nil], name: "index_products_on_base_sku"

  create_table "sku_mappings", force: :cascade do |t|
    t.string   "sku"
    t.string   "sku_mapable_type"
    t.integer  "sku_mapable_id"
    t.string   "source",           default: "manual"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sku_mappings", ["sku"], name: "index_sku_mappings_on_sku", unique: true

  create_table "sku_patterns", force: :cascade do |t|
    t.integer  "brand_id"
    t.string   "pattern"
    t.string   "condition"
    t.string   "granularity", default: "Variant"
    t.float    "priority"
    t.string   "delimiter",   default: "-"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", force: :cascade do |t|
    t.string   "raw_state"
    t.string   "clean_state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "states", ["raw_state"], name: "index_states_on_raw_state"

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "store_type"
    t.integer  "order_results_per_page"
    t.integer  "max_order_pages"
    t.string   "queue_flag"
    t.string   "verify_flag"
    t.string   "authenticated_url"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
  end

  create_table "sub_variants", force: :cascade do |t|
    t.integer  "variant_id"
    t.string   "sku"
    t.string   "upc"
    t.string   "size"
    t.string   "availability"
    t.string   "amazon_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "asin"
    t.text     "size_code"
    t.integer  "fulfillment_latency"
    t.integer  "quantity"
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: :cascade do |t|
    t.string "name"
  end

  create_table "variant_images", force: :cascade do |t|
    t.integer  "variant_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "image_width"
    t.integer  "image_height"
    t.string   "image2_file_name"
    t.string   "image2_content_type"
    t.integer  "image2_file_size"
    t.datetime "image2_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "unique_image_file_name"
  end

  add_index "variant_images", ["unique_image_file_name"], name: "index_variant_images_on_unique_image_file_name"
  add_index "variant_images", ["variant_id"], name: "index_variant_images_on_variant_id"

  create_table "variant_updates", force: :cascade do |t|
    t.integer  "variant_id"
    t.float    "price"
    t.float    "cost_price"
    t.string   "availability"
    t.datetime "update_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "import_id"
  end

  create_table "variants", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "sku"
    t.decimal  "price"
    t.decimal  "cost_price"
    t.decimal  "weight"
    t.decimal  "height"
    t.decimal  "width"
    t.decimal  "depth"
    t.string   "size"
    t.string   "color1"
    t.string   "color2"
    t.string   "color1_code"
    t.string   "color2_code"
    t.string   "availability"
    t.datetime "deleted_at"
    t.boolean  "is_master"
    t.integer  "position"
    t.text     "amazon_description"
    t.string   "upc"
    t.string   "size_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "sale_price"
    t.float    "msrp"
    t.string   "currency"
    t.integer  "leadtime_to_ship"
    t.text     "asin"
  end

  add_index "variants", ["product_id"], name: "index_variants_on_product_id"
  add_index "variants", ["sku"], name: "index_variants_on_sku"
  add_index "variants", [nil], name: "index_variants_on_amazon_product_id"

  create_table "vendors", force: :cascade do |t|
    t.string   "name"
    t.datetime "scraped_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "icon_file_name"
    t.string   "icon_content_type"
    t.integer  "icon_file_size"
    t.datetime "icon_updated_at"
    t.string   "base_url"
    t.string   "login_url"
    t.string   "username"
    t.string   "password"
  end

end
