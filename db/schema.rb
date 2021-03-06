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

ActiveRecord::Schema.define(version: 20140804195848) do

  create_table "attachments", force: true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "title"
    t.string   "alt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "position"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug", unique: true, using: :btree

  create_table "chat_messages", force: true do |t|
    t.integer  "user_id"
    t.string   "message"
    t.string   "socket_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "channel"
    t.string   "avatar"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "chat_messages", ["user_id"], name: "index_chat_messages_on_user_id", using: :btree

  create_table "clients", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "featured",            default: false
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.boolean  "active",              default: true
    t.integer  "assigned_to_id"
    t.integer  "client_owner_id"
  end

  add_index "clients", ["assigned_to_id"], name: "index_clients_on_assigned_to_id", using: :btree
  add_index "clients", ["client_owner_id"], name: "index_clients_on_client_owner_id", using: :btree

  create_table "comments", force: true do |t|
    t.integer  "commentable_id",                     default: 0
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",                            default: 0,   null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cached_votes_total",                 default: 0
    t.integer  "cached_votes_score",                 default: 0
    t.integer  "cached_votes_up",                    default: 0
    t.integer  "cached_votes_down",                  default: 0
    t.integer  "cached_weighted_score",              default: 0
    t.integer  "cached_weighted_total",              default: 0
    t.float    "cached_weighted_average", limit: 24, default: 0.0
  end

  add_index "comments", ["cached_votes_down"], name: "index_comments_on_cached_votes_down", using: :btree
  add_index "comments", ["cached_votes_score"], name: "index_comments_on_cached_votes_score", using: :btree
  add_index "comments", ["cached_votes_total"], name: "index_comments_on_cached_votes_total", using: :btree
  add_index "comments", ["cached_votes_up"], name: "index_comments_on_cached_votes_up", using: :btree
  add_index "comments", ["cached_weighted_average"], name: "index_comments_on_cached_weighted_average", using: :btree
  add_index "comments", ["cached_weighted_score"], name: "index_comments_on_cached_weighted_score", using: :btree
  add_index "comments", ["cached_weighted_total"], name: "index_comments_on_cached_weighted_total", using: :btree
  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.integer  "client_id"
    t.text     "notes"
    t.string   "customer_number"
    t.datetime "customer_since"
    t.string   "first_interaction"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "contacts", ["client_id"], name: "index_contacts_on_client_id", using: :btree
  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "conversations", force: true do |t|
    t.string   "subject"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "client_id"
    t.integer  "created_by_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["client_id"], name: "index_events_on_client_id", using: :btree
  add_index "events", ["created_by_id"], name: "index_events_on_created_by_id", using: :btree

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "galleries", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "category_id"
    t.integer  "cached_votes_total",                 default: 0
    t.integer  "cached_votes_score",                 default: 0
    t.integer  "cached_votes_up",                    default: 0
    t.integer  "cached_votes_down",                  default: 0
    t.integer  "cached_weighted_score",              default: 0
    t.integer  "cached_weighted_total",              default: 0
    t.float    "cached_weighted_average", limit: 24, default: 0.0
    t.integer  "impressions_count",                  default: 0
  end

  add_index "galleries", ["cached_votes_down"], name: "index_galleries_on_cached_votes_down", using: :btree
  add_index "galleries", ["cached_votes_score"], name: "index_galleries_on_cached_votes_score", using: :btree
  add_index "galleries", ["cached_votes_total"], name: "index_galleries_on_cached_votes_total", using: :btree
  add_index "galleries", ["cached_votes_up"], name: "index_galleries_on_cached_votes_up", using: :btree
  add_index "galleries", ["cached_weighted_average"], name: "index_galleries_on_cached_weighted_average", using: :btree
  add_index "galleries", ["cached_weighted_score"], name: "index_galleries_on_cached_weighted_score", using: :btree
  add_index "galleries", ["cached_weighted_total"], name: "index_galleries_on_cached_weighted_total", using: :btree
  add_index "galleries", ["category_id"], name: "index_galleries_on_category_id", using: :btree
  add_index "galleries", ["slug"], name: "index_galleries_on_slug", unique: true, using: :btree

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "impressions", force: true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], name: "controlleraction_ip_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "request_hash"], name: "controlleraction_request_index", using: :btree
  add_index "impressions", ["controller_name", "action_name", "session_hash"], name: "controlleraction_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], name: "poly_ip_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], name: "poly_request_index", using: :btree
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], name: "poly_session_index", using: :btree
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], name: "impressionable_type_message_index", length: {"impressionable_type"=>nil, "message"=>255, "impressionable_id"=>nil}, using: :btree
  add_index "impressions", ["user_id"], name: "index_impressions_on_user_id", using: :btree

  create_table "interaction_events", force: true do |t|
    t.string   "name"
    t.integer  "interaction_id"
    t.text     "description"
    t.boolean  "billable",       default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interactions", force: true do |t|
    t.integer  "interactive_id"
    t.string   "interactive_type"
    t.string   "event"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content"
    t.integer  "time",                 default: 0
    t.integer  "interaction_event_id"
  end

  add_index "interactions", ["interaction_event_id"], name: "index_interactions_on_interaction_event_id", using: :btree

  create_table "invoice_statuses", force: true do |t|
    t.string   "state"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.string   "subject"
    t.integer  "client_id"
    t.date     "started_on"
    t.date     "completed_on"
    t.decimal  "total",             precision: 8, scale: 2
    t.text     "notes"
    t.string   "attention"
    t.integer  "inv_number"
    t.boolean  "paid"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_status_id"
    t.string   "aasm_state"
    t.datetime "paid_on"
    t.datetime "quoted_on"
    t.string   "status"
    t.integer  "balance_cents",                             default: 0,     null: false
    t.string   "balance_currency",                          default: "USD", null: false
  end

  add_index "invoices", ["client_id"], name: "index_invoices_on_client_id", using: :btree
  add_index "invoices", ["invoice_status_id"], name: "index_invoices_on_invoice_status_id", using: :btree

  create_table "items", force: true do |t|
    t.decimal  "cost",             precision: 8, scale: 2
    t.string   "name"
    t.text     "description"
    t.integer  "item_num"
    t.integer  "quantity"
    t.integer  "invoice_id"
    t.integer  "purchasable_id"
    t.string   "purchasable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",            precision: 8, scale: 2
  end

  create_table "message_receipts", force: true do |t|
    t.integer  "receivable_id"
    t.string   "receivable_type"
    t.integer  "message_id"
    t.boolean  "read"
    t.boolean  "trashed"
    t.boolean  "deleted"
    t.string   "mailbox_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sender_id"
    t.string   "sender_type"
  end

  add_index "message_receipts", ["message_id"], name: "index_message_receipts_on_message_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "type"
    t.integer  "conversation_id"
    t.integer  "client_id"
    t.integer  "project_id"
    t.integer  "sender_id"
    t.string   "sender_type"
    t.string   "notification_code"
    t.integer  "notified_object_id"
    t.string   "notified_object_type"
    t.string   "source"
    t.text     "body"
    t.string   "subject"
    t.boolean  "draft"
    t.string   "attachment"
    t.datetime "expires"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.integer  "contact_id"
    t.string   "ancestry"
  end

  add_index "messages", ["ancestry"], name: "index_messages_on_ancestry", using: :btree
  add_index "messages", ["client_id"], name: "index_messages_on_client_id", using: :btree
  add_index "messages", ["contact_id"], name: "index_messages_on_contact_id", using: :btree
  add_index "messages", ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
  add_index "messages", ["project_id"], name: "index_messages_on_project_id", using: :btree

  create_table "milestones", force: true do |t|
    t.integer  "project_id"
    t.text     "description"
    t.datetime "completed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "milestones", ["project_id"], name: "index_milestones_on_project_id", using: :btree

  create_table "notes", force: true do |t|
    t.string   "subject"
    t.string   "body"
    t.integer  "created_by_id"
    t.integer  "notable_id"
    t.string   "notable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "notes", ["created_by_id"], name: "index_notes_on_created_by_id", using: :btree

  create_table "payment_methods", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "payments", force: true do |t|
    t.integer  "invoice_id"
    t.integer  "source_id"
    t.string   "source_type"
    t.integer  "payment_method_id"
    t.string   "state"
    t.string   "response_code"
    t.string   "avs_response"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "payable_id"
    t.string   "payable_type"
    t.integer  "amount_cents",      default: 0,     null: false
    t.string   "amount_currency",   default: "USD", null: false
  end

  add_index "payments", ["invoice_id"], name: "index_payments_on_invoice_id", using: :btree

  create_table "photos", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "gallery_id"
    t.string   "slug"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.integer  "cached_votes_total",                 default: 0
    t.integer  "cached_votes_score",                 default: 0
    t.integer  "cached_votes_up",                    default: 0
    t.integer  "cached_votes_down",                  default: 0
    t.integer  "cached_weighted_score",              default: 0
    t.integer  "cached_weighted_total",              default: 0
    t.float    "cached_weighted_average", limit: 24, default: 0.0
    t.integer  "impressions_count",                  default: 0
  end

  add_index "photos", ["cached_votes_down"], name: "index_photos_on_cached_votes_down", using: :btree
  add_index "photos", ["cached_votes_score"], name: "index_photos_on_cached_votes_score", using: :btree
  add_index "photos", ["cached_votes_total"], name: "index_photos_on_cached_votes_total", using: :btree
  add_index "photos", ["cached_votes_up"], name: "index_photos_on_cached_votes_up", using: :btree
  add_index "photos", ["cached_weighted_average"], name: "index_photos_on_cached_weighted_average", using: :btree
  add_index "photos", ["cached_weighted_score"], name: "index_photos_on_cached_weighted_score", using: :btree
  add_index "photos", ["cached_weighted_total"], name: "index_photos_on_cached_weighted_total", using: :btree
  add_index "photos", ["category_id"], name: "index_photos_on_category_id", using: :btree
  add_index "photos", ["gallery_id"], name: "index_photos_on_gallery_id", using: :btree
  add_index "photos", ["slug"], name: "index_photos_on_slug", unique: true, using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.date     "published_at"
    t.integer  "author_id"
    t.boolean  "draft"
    t.text     "excerpt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "slug"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.integer  "cached_votes_total",                 default: 0
    t.integer  "cached_votes_score",                 default: 0
    t.integer  "cached_votes_up",                    default: 0
    t.integer  "cached_votes_down",                  default: 0
    t.integer  "cached_weighted_score",              default: 0
    t.integer  "cached_weighted_total",              default: 0
    t.float    "cached_weighted_average", limit: 24, default: 0.0
    t.integer  "impressions_count",                  default: 0
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree
  add_index "posts", ["cached_votes_down"], name: "index_posts_on_cached_votes_down", using: :btree
  add_index "posts", ["cached_votes_score"], name: "index_posts_on_cached_votes_score", using: :btree
  add_index "posts", ["cached_votes_total"], name: "index_posts_on_cached_votes_total", using: :btree
  add_index "posts", ["cached_votes_up"], name: "index_posts_on_cached_votes_up", using: :btree
  add_index "posts", ["cached_weighted_average"], name: "index_posts_on_cached_weighted_average", using: :btree
  add_index "posts", ["cached_weighted_score"], name: "index_posts_on_cached_weighted_score", using: :btree
  add_index "posts", ["cached_weighted_total"], name: "index_posts_on_cached_weighted_total", using: :btree
  add_index "posts", ["category_id"], name: "index_posts_on_category_id", using: :btree
  add_index "posts", ["slug"], name: "index_posts_on_slug", unique: true, using: :btree

  create_table "products", force: true do |t|
    t.string   "name",                      default: "",    null: false
    t.text     "description"
    t.integer  "stock",                     default: 0
    t.boolean  "available",                 default: false
    t.datetime "available_on"
    t.string   "slug"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.string   "sku",                       default: "",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.integer  "category_id"
    t.integer  "position"
    t.string   "header_photo_file_name"
    t.string   "header_photo_content_type"
    t.integer  "header_photo_file_size"
    t.datetime "header_photo_updated_at"
    t.boolean  "featured",                  default: true
    t.text     "summary"
    t.integer  "cost_cents",                default: 0,     null: false
    t.string   "cost_currency",             default: "USD", null: false
    t.integer  "price_cents",               default: 0,     null: false
    t.string   "price_currency",            default: "USD", null: false
    t.boolean  "listed",                    default: true
  end

  add_index "products", ["slug"], name: "index_products_on_slug", unique: true, using: :btree

  create_table "projects", force: true do |t|
    t.integer  "client_id"
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["category_id"], name: "index_projects_on_category_id", using: :btree
  add_index "projects", ["client_id"], name: "index_projects_on_client_id", using: :btree

  create_table "rate_types", force: true do |t|
    t.string   "name"
    t.integer  "unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "services", force: true do |t|
    t.string   "name"
    t.string   "summary"
    t.text     "description"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_icon"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.string   "header_file_name"
    t.string   "header_content_type"
    t.integer  "header_file_size"
    t.datetime "header_updated_at"
    t.decimal  "duration",            precision: 30, scale: 10
    t.integer  "rate_type_id"
    t.boolean  "featured",                                      default: false
    t.integer  "sort_value",                                    default: 0
    t.string   "slug"
    t.integer  "position"
    t.boolean  "listed",                                        default: false
    t.integer  "price_cents",                                   default: 0,     null: false
    t.string   "price_currency",                                default: "USD", null: false
    t.integer  "cost_cents",                                    default: 0,     null: false
    t.string   "cost_currency",                                 default: "USD", null: false
  end

  add_index "services", ["category_id"], name: "index_services_on_category_id", using: :btree
  add_index "services", ["rate_type_id"], name: "index_services_on_rate_type_id", using: :btree
  add_index "services", ["slug"], name: "index_services_on_slug", unique: true, using: :btree

  create_table "settings", force: true do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "severity_types", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sponsors", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "category_id"
    t.boolean  "enabled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "url"
    t.string   "video_url"
    t.string   "phone"
    t.string   "email"
    t.integer  "client_id"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "slug"
    t.string   "banner_file_name"
    t.string   "banner_content_type"
    t.integer  "banner_file_size"
    t.datetime "banner_updated_at"
    t.integer  "impressions_count",                  default: 0
    t.integer  "cached_votes_total",                 default: 0
    t.integer  "cached_votes_score",                 default: 0
    t.integer  "cached_votes_up",                    default: 0
    t.integer  "cached_votes_down",                  default: 0
    t.integer  "cached_weighted_score",              default: 0
    t.integer  "cached_weighted_total",              default: 0
    t.float    "cached_weighted_average", limit: 24, default: 0.0
  end

  add_index "sponsors", ["cached_votes_down"], name: "index_sponsors_on_cached_votes_down", using: :btree
  add_index "sponsors", ["cached_votes_score"], name: "index_sponsors_on_cached_votes_score", using: :btree
  add_index "sponsors", ["cached_votes_total"], name: "index_sponsors_on_cached_votes_total", using: :btree
  add_index "sponsors", ["cached_votes_up"], name: "index_sponsors_on_cached_votes_up", using: :btree
  add_index "sponsors", ["cached_weighted_average"], name: "index_sponsors_on_cached_weighted_average", using: :btree
  add_index "sponsors", ["cached_weighted_score"], name: "index_sponsors_on_cached_weighted_score", using: :btree
  add_index "sponsors", ["cached_weighted_total"], name: "index_sponsors_on_cached_weighted_total", using: :btree
  add_index "sponsors", ["category_id"], name: "index_sponsors_on_category_id", using: :btree
  add_index "sponsors", ["client_id"], name: "index_sponsors_on_client_id", using: :btree
  add_index "sponsors", ["slug"], name: "index_sponsors_on_slug", unique: true, using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
    t.string  "slug"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree
  add_index "tags", ["slug"], name: "index_tags_on_slug", using: :btree

  create_table "tasks", force: true do |t|
    t.string   "item"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "importance"
    t.datetime "completed_at"
    t.boolean  "completed",    default: false
    t.integer  "client_id"
    t.integer  "user_id"
    t.integer  "position"
  end

  add_index "tasks", ["client_id"], name: "index_tasks_on_client_id", using: :btree
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id", using: :btree

  create_table "ticket_statuses", force: true do |t|
    t.string   "state"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tickets", force: true do |t|
    t.string   "subject"
    t.integer  "client_id"
    t.text     "description"
    t.string   "severity"
    t.string   "status"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "resolution"
    t.integer  "assignable_id"
    t.string   "assignable_type"
    t.integer  "severity_type_id"
    t.integer  "ticket_status_id"
    t.string   "aasm_state"
    t.datetime "closed_at"
    t.datetime "pended_at"
    t.datetime "in_progress_at"
    t.integer  "user_id"
  end

  add_index "tickets", ["client_id"], name: "index_tickets_on_client_id", using: :btree
  add_index "tickets", ["severity_type_id"], name: "index_tickets_on_severity_type_id", using: :btree
  add_index "tickets", ["ticket_status_id"], name: "index_tickets_on_ticket_status_id", using: :btree
  add_index "tickets", ["user_id"], name: "index_tickets_on_user_id", using: :btree

  create_table "timesheets", force: true do |t|
    t.datetime "clocked_in"
    t.datetime "clocked_out"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source"
  end

  add_index "timesheets", ["user_id"], name: "index_timesheets_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "first_name",             default: "",    null: false
    t.string   "last_name",              default: "",    null: false
    t.string   "telephone",              default: "",    null: false
    t.string   "address",                default: "",    null: false
    t.string   "city",                   default: "",    null: false
    t.string   "state",                  default: "",    null: false
    t.string   "zip",                    default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.integer  "client_id"
    t.boolean  "can_assign"
    t.string   "title"
    t.boolean  "active"
    t.string   "company"
    t.string   "country"
    t.string   "manager"
    t.string   "mobile_phone"
    t.boolean  "self_created"
    t.boolean  "clocked_in",             default: false
    t.boolean  "employee",               default: false
    t.string   "slug"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "name"
  end

  add_index "users", ["client_id"], name: "index_users_on_client_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

  create_table "videos", force: true do |t|
    t.string   "link"
    t.string   "title"
    t.string   "author"
    t.string   "duration"
    t.integer  "likes"
    t.integer  "dislikes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.integer  "category_id"
    t.boolean  "featured",                           default: true
    t.boolean  "listed",                             default: true
    t.string   "yt_tags"
    t.integer  "views"
    t.integer  "position"
    t.datetime "published_at"
    t.datetime "yt_updated_at"
    t.string   "slug"
    t.integer  "sponsor_id"
    t.boolean  "sponsored",                          default: false
    t.text     "embed"
    t.string   "url"
    t.text     "description"
    t.integer  "gallery_id"
    t.string   "thumbnail_file_name"
    t.string   "thumbnail_content_type"
    t.integer  "thumbnail_file_size"
    t.datetime "thumbnail_updated_at"
    t.integer  "cached_votes_total",                 default: 0
    t.integer  "cached_votes_score",                 default: 0
    t.integer  "cached_votes_up",                    default: 0
    t.integer  "cached_votes_down",                  default: 0
    t.integer  "cached_weighted_score",              default: 0
    t.integer  "cached_weighted_total",              default: 0
    t.float    "cached_weighted_average", limit: 24, default: 0.0
    t.integer  "impressions_count",                  default: 0
  end

  add_index "videos", ["cached_votes_down"], name: "index_videos_on_cached_votes_down", using: :btree
  add_index "videos", ["cached_votes_score"], name: "index_videos_on_cached_votes_score", using: :btree
  add_index "videos", ["cached_votes_total"], name: "index_videos_on_cached_votes_total", using: :btree
  add_index "videos", ["cached_votes_up"], name: "index_videos_on_cached_votes_up", using: :btree
  add_index "videos", ["cached_weighted_average"], name: "index_videos_on_cached_weighted_average", using: :btree
  add_index "videos", ["cached_weighted_score"], name: "index_videos_on_cached_weighted_score", using: :btree
  add_index "videos", ["cached_weighted_total"], name: "index_videos_on_cached_weighted_total", using: :btree
  add_index "videos", ["category_id"], name: "index_videos_on_category_id", using: :btree
  add_index "videos", ["gallery_id"], name: "index_videos_on_gallery_id", using: :btree
  add_index "videos", ["slug"], name: "index_videos_on_slug", unique: true, using: :btree
  add_index "videos", ["sponsor_id"], name: "index_videos_on_sponsor_id", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end
