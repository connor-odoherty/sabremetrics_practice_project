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

ActiveRecord::Schema.define(version: 20170528224362) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"
  enable_extension "postgis"

  create_table "aircraft_call_sign_aliases", force: :cascade do |t|
    t.integer  "aircraft_id"
    t.string   "call_sign",   limit: 16
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "aircraft_call_sign_aliases", ["aircraft_id"], name: "index_aircraft_call_sign_aliases_on_aircraft_id", using: :btree

  create_table "aircraft_categories", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.string   "display_name",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "suggested_range_min"
    t.integer  "suggested_range_max"
    t.integer  "range_max"
    t.integer  "pricing_per_mile"
    t.integer  "pricing_base"
    t.integer  "pricing_minimum"
    t.integer  "pricing_range"
    t.integer  "pax_min"
    t.integer  "pax_max"
    t.integer  "sample_aircraft_type_id"
    t.integer  "price_per_night"
    t.boolean  "is_jet",                              default: true
  end

  create_table "aircraft_currency_event_documents", force: :cascade do |t|
    t.string   "uuid"
    t.integer  "aircraft_currency_event_id"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
    t.string   "display_name"
    t.boolean  "active"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "aircraft_currency_event_documents", ["aircraft_currency_event_id"], name: "index_aircraft_currency_event_docs_on_aircraft_cur_event_id", using: :btree
  add_index "aircraft_currency_event_documents", ["uuid"], name: "index_aircraft_currency_event_documents_on_uuid", using: :btree

  create_table "aircraft_currency_events", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "aircraft_id"
    t.integer  "operator_enabled_aircraft_currency_type_id"
    t.date     "completed"
    t.date     "expires_date"
    t.decimal  "expires_airframe_hours",                     precision: 8, scale: 2
    t.integer  "expires_airframe_cycles"
    t.decimal  "expires_engine_1_hours",                     precision: 8, scale: 2
    t.integer  "expires_engine_1_cycles"
    t.decimal  "expires_engine_2_hours",                     precision: 8, scale: 2
    t.integer  "expires_engine_2_cycles"
    t.decimal  "expires_engine_3_hours",                     precision: 8, scale: 2
    t.integer  "expires_engine_3_cycles"
    t.decimal  "expires_prop_1_hours",                       precision: 8, scale: 2
    t.decimal  "expires_prop_2_hours",                       precision: 8, scale: 2
    t.decimal  "expires_apu_1_hours",                        precision: 8, scale: 2
    t.integer  "expires_apu_1_cycles"
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.string   "uuid"
    t.string   "expires_date_description"
    t.string   "expires_airframe_hours_description"
    t.string   "expires_airframe_cycles_description"
    t.string   "expires_engine_1_hours_description"
    t.string   "expires_engine_1_cycles_description"
    t.string   "expires_engine_2_hours_description"
    t.string   "expires_engine_2_cycles_description"
    t.string   "expires_engine_3_hours_description"
    t.string   "expires_engine_3_cycles_description"
    t.string   "expires_prop_1_hours_description"
    t.string   "expires_prop_2_hours_description"
    t.string   "expires_apu_1_hours_description"
    t.string   "expires_apu_1_cycles_description"
  end

  add_index "aircraft_currency_events", ["operator_id"], name: "index_aircraft_currency_events_on_operator_id", using: :btree
  add_index "aircraft_currency_events", ["uuid"], name: "index_aircraft_currency_events_on_uuid", unique: true, using: :btree

  create_table "aircraft_currency_types", force: :cascade do |t|
    t.integer  "index"
    t.string   "name"
    t.string   "display_name"
    t.integer  "duration",                     default: 0
    t.boolean  "expires_at_month_end",         default: false
    t.string   "duration_units",               default: "months"
    t.boolean  "date_only_expiration_type",    default: false
    t.boolean  "uses_expires_airframe_hours",  default: false
    t.boolean  "uses_expires_airframe_cycles", default: false
    t.boolean  "uses_expires_engine_1_hours",  default: false
    t.boolean  "uses_expires_engine_1_cycles", default: false
    t.boolean  "uses_expires_engine_2_hours",  default: false
    t.boolean  "uses_expires_engine_2_cycles", default: false
    t.boolean  "uses_expires_engine_3_hours",  default: false
    t.boolean  "uses_expires_engine_3_cycles", default: false
    t.boolean  "uses_expires_prop_1_hours",    default: false
    t.boolean  "uses_expires_prop_2_hours",    default: false
    t.boolean  "uses_expires_apu_1_hours",     default: false
    t.boolean  "uses_expires_apu_1_cycles",    default: false
    t.boolean  "active",                       default: true
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "aircraft_document_types", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "aircraft_documents", force: :cascade do |t|
    t.string   "display_name"
    t.string   "uuid"
    t.integer  "aircraft_id"
    t.integer  "aircraft_document_type_id"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
    t.boolean  "active",                    default: true
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "aircraft_documents", ["aircraft_id"], name: "index_aircraft_documents_on_aircraft_id", using: :btree
  add_index "aircraft_documents", ["uuid"], name: "index_aircraft_documents_on_uuid", using: :btree

  create_table "aircraft_event_flight_personnel_roles", force: :cascade do |t|
    t.integer  "aircraft_id"
    t.integer  "event_flight_personnel_role_id"
    t.boolean  "required"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "aircraft_event_flight_personnel_roles", ["aircraft_id"], name: "index_aircraft_event_flight_personnel_roles_on_aircraft_id", using: :btree

  create_table "aircraft_flight_logs", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "aircraft_id"
    t.integer  "marked_complete_by_id"
    t.datetime "marked_complete_on"
    t.datetime "start"
    t.datetime "finish"
    t.decimal  "total_airframe_hours",               precision: 8, scale: 2
    t.integer  "total_airframe_cycles"
    t.decimal  "total_engine_1_hours",               precision: 8, scale: 2
    t.integer  "total_engine_1_cycles"
    t.decimal  "total_engine_2_hours",               precision: 8, scale: 2
    t.integer  "total_engine_2_cycles"
    t.decimal  "total_engine_3_hours",               precision: 8, scale: 2
    t.integer  "total_engine_3_cycles"
    t.decimal  "total_apu_1_hours",                  precision: 8, scale: 2
    t.integer  "total_apu_1_cycles"
    t.decimal  "correction_airframe_hours",          precision: 8, scale: 2
    t.integer  "correction_airframe_cycles"
    t.decimal  "correction_engine_1_hours",          precision: 8, scale: 2
    t.integer  "correction_engine_1_cycles"
    t.decimal  "correction_engine_2_hours",          precision: 8, scale: 2
    t.integer  "correction_engine_2_cycles"
    t.decimal  "correction_engine_3_hours",          precision: 8, scale: 2
    t.integer  "correction_engine_3_cycles"
    t.decimal  "correction_apu_1_hours",             precision: 8, scale: 2
    t.integer  "correction_apu_1_cycles"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "uuid"
    t.integer  "maintenance_approved_by_id"
    t.datetime "maintenance_approved_on"
    t.datetime "marked_fully_complete_on"
    t.string   "log_id"
    t.decimal  "segments_airframe_hours",            precision: 8, scale: 2
    t.integer  "segments_airframe_cycles"
    t.decimal  "segments_engine_1_hours",            precision: 8, scale: 2
    t.integer  "segments_engine_1_cycles"
    t.decimal  "segments_engine_2_hours",            precision: 8, scale: 2
    t.integer  "segments_engine_2_cycles"
    t.decimal  "segments_engine_3_hours",            precision: 8, scale: 2
    t.integer  "segments_engine_3_cycles"
    t.decimal  "segments_apu_1_hours",               precision: 8, scale: 2
    t.integer  "segments_apu_1_cycles"
    t.string   "post_log_pdf_file_name"
    t.string   "segments_route"
    t.text     "maintenance_rejection_reason"
    t.string   "pre_log_pdf_file_name"
    t.integer  "pre_flight_sign_off_e_signature_id"
    t.integer  "log_complete_pilot_e_signature_id"
  end

  add_index "aircraft_flight_logs", ["operator_id"], name: "index_aircraft_flight_logs_on_operator_id", using: :btree
  add_index "aircraft_flight_logs", ["uuid"], name: "index_aircraft_flight_logs_on_uuid", using: :btree

  create_table "aircraft_photos", force: :cascade do |t|
    t.integer  "aircraft_id"
    t.integer  "index"
    t.string   "url",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "aircraft_photos", ["aircraft_id"], name: "index_aircraft_photos_on_aircraft_id", using: :btree

  create_table "aircraft_pricing_line_items", force: :cascade do |t|
    t.integer  "aircraft_id"
    t.integer  "line_item_type_id"
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.decimal  "quantity_waived",   precision: 15, scale: 1, default: 0.0
    t.decimal  "quantity_minimum",  precision: 15, scale: 1, default: 0.0
    t.decimal  "value"
    t.decimal  "cost_value"
  end

  add_index "aircraft_pricing_line_items", ["aircraft_id"], name: "index_aircraft_pricing_line_items_on_aircraft_id", using: :btree
  add_index "aircraft_pricing_line_items", ["line_item_type_id"], name: "index_aircraft_pricing_line_items_on_line_item_type_id", using: :btree

  create_table "aircraft_service_issues", force: :cascade do |t|
    t.integer  "logged_by_id"
    t.text     "issue_text"
    t.integer  "trip_service_issue_type_id"
    t.date     "discovery_date"
    t.integer  "marked_resolved_by_id"
    t.datetime "marked_resolved_on"
    t.text     "resolution_text"
    t.integer  "operator_id"
    t.integer  "aircraft_id"
    t.integer  "trip_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "aircraft_service_issues", ["aircraft_id"], name: "index_aircraft_service_issues_on_aircraft_id", using: :btree
  add_index "aircraft_service_issues", ["operator_id"], name: "index_aircraft_service_issues_on_operator_id", using: :btree
  add_index "aircraft_service_issues", ["trip_id"], name: "index_aircraft_service_issues_on_trip_id", using: :btree

  create_table "aircraft_type_default_values", force: :cascade do |t|
    t.integer  "aircraft_type_id"
    t.boolean  "pic_required"
    t.boolean  "sic_required"
    t.integer  "takeoff_speed"
    t.integer  "climb_speed"
    t.integer  "climb_rate"
    t.integer  "tas"
    t.integer  "cruise_altitude"
    t.integer  "descend_speed"
    t.integer  "descend_rate"
    t.integer  "landing_speed"
    t.integer  "runway_length"
    t.integer  "runway_width"
    t.integer  "range"
    t.integer  "revenue_block_time_revenue"
    t.integer  "revenue_block_time_cost"
    t.integer  "positioning_block_time_revenue"
    t.integer  "positioning_block_time_cost"
    t.integer  "daily_minimum_revenue"
    t.integer  "daily_minimum_cost"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "aircraft_type_default_values", ["aircraft_type_id"], name: "index_aircraft_type_default_values_on_aircraft_type_id", using: :btree

  create_table "aircraft_type_families", force: :cascade do |t|
    t.string  "family_name"
    t.integer "aircraft_type_group_id"
    t.integer "canonical_aircraft_type_id"
    t.string  "slug"
  end

  create_table "aircraft_type_groups", force: :cascade do |t|
    t.integer "canonical_aircraft_type_family_id"
    t.string  "group_name"
    t.string  "slug"
    t.string  "short_description",                 default: ""
    t.text    "long_description",                  default: ""
  end

  create_table "aircraft_types", force: :cascade do |t|
    t.string   "name",                    limit: 255,             null: false
    t.string   "icao_type",               limit: 255,             null: false
    t.string   "manufacturer",            limit: 255,             null: false
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "pax_min"
    t.integer  "pax_max"
    t.integer  "range"
    t.integer  "service_ceiling"
    t.integer  "max_cruise_speed"
    t.integer  "length"
    t.integer  "wingspan"
    t.string   "photo_url"
    t.string   "slug"
    t.integer  "height"
    t.text     "description"
    t.integer  "max_takeoff_weight",                  default: 0
    t.integer  "engine_count",                        default: 0
    t.integer  "default_range",                       default: 0
    t.string   "type_rating_designation"
    t.integer  "apu_count",                           default: 0
    t.integer  "aircraft_type_family_id"
  end

  add_index "aircraft_types", ["category_id"], name: "index_aircraft_types_on_category_id", using: :btree
  add_index "aircraft_types", ["icao_type"], name: "index_aircraft_types_on_icao_type", using: :btree
  add_index "aircraft_types", ["slug"], name: "index_aircraft_types_on_slug", unique: true, using: :btree

  create_table "aircrafts", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "home_base_id"
    t.integer  "aircraft_type_id"
    t.integer  "pax",                                                                                   null: false
    t.integer  "year",                                                                                  null: false
    t.string   "reg",                               limit: 255,                                         null: false
    t.text     "amenities",                                                                             null: false
    t.date     "exterior_refurb"
    t.date     "interior_refurb"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "index",                                                                 default: 1
    t.boolean  "active",                                                                default: true
    t.integer  "event_color_id"
    t.boolean  "require_passenger_dob",                                                 default: false
    t.boolean  "require_tfssp_check",                                                   default: false
    t.boolean  "require_passenger_weight",                                              default: true
    t.boolean  "platform_validated",                                                    default: false
    t.boolean  "flight_tracking_enabled",                                               default: false
    t.integer  "max_take_off_weight"
    t.decimal  "cg_forward_limit",                              precision: 5, scale: 1
    t.decimal  "cg_aft_limit",                                  precision: 5, scale: 1
    t.boolean  "virtual_aircraft",                                                      default: false
    t.string   "type_display_name_override"
    t.integer  "vor_check_option",                                                      default: 0
    t.integer  "weight_and_balance_check_option",                                       default: 0
    t.integer  "home_base_fbo_id"
    t.integer  "airworthiness_release_option",                                          default: 0
    t.integer  "current_airport_override_id"
    t.datetime "current_airport_override_datetime"
    t.string   "uuid"
    t.decimal  "cg_forward_limit_percent",                      precision: 5, scale: 2
    t.decimal  "cg_aft_limit_percent",                          precision: 5, scale: 2
  end

  add_index "aircrafts", ["aircraft_type_id"], name: "index_aircrafts_on_aircraft_type_id", using: :btree
  add_index "aircrafts", ["home_base_id"], name: "index_aircrafts_on_home_base_id", using: :btree
  add_index "aircrafts", ["operator_id"], name: "index_aircrafts_on_operator_id", using: :btree
  add_index "aircrafts", ["reg"], name: "index_aircrafts_on_reg", unique: true, using: :btree

  create_table "airport_caterers", force: :cascade do |t|
    t.integer  "airport_id"
    t.string   "external_id"
    t.string   "name"
    t.string   "toll_free_phone"
    t.string   "phone"
    t.string   "fax_phone"
    t.string   "web_site_url"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "active",          default: true
  end

  add_index "airport_caterers", ["airport_id"], name: "index_airport_caterers_on_airport_id", using: :btree
  add_index "airport_caterers", ["external_id"], name: "index_airport_caterers_on_external_id", unique: true, using: :btree

  create_table "airport_comments", force: :cascade do |t|
    t.integer  "airport_id"
    t.integer  "operator_id"
    t.text     "comments"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "airport_comments", ["airport_id"], name: "index_airport_comments_on_airport_id", using: :btree
  add_index "airport_comments", ["operator_id"], name: "index_airport_comments_on_operator_id", using: :btree

  create_table "airport_fbo_fuel_prices", force: :cascade do |t|
    t.integer  "airport_fbo_id"
    t.integer  "operator_id"
    t.integer  "gals_from"
    t.integer  "gals_to"
    t.boolean  "jet"
    t.boolean  "full_service",                              default: true
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "fuel_price_source"
    t.decimal  "price",             precision: 7, scale: 5
  end

  add_index "airport_fbo_fuel_prices", ["airport_fbo_id"], name: "index_airport_fbo_fuel_prices_on_airport_fbo_id", using: :btree
  add_index "airport_fbo_fuel_prices", ["operator_id"], name: "index_airport_fbo_fuel_prices_on_operator_id", using: :btree

  create_table "airport_fbos", force: :cascade do |t|
    t.integer  "index"
    t.integer  "airport_id"
    t.string   "name",                limit: 255
    t.integer  "contact_info_id"
    t.string   "email",               limit: 255
    t.string   "url",                 limit: 255
    t.string   "business_hours",      limit: 255
    t.string   "freq_unicom",         limit: 255
    t.string   "freq_arinc",          limit: 255
    t.string   "freq_a2g",            limit: 255
    t.string   "latitude",            limit: 255
    t.string   "longitude",           limit: 255
    t.string   "fuel_brands",         limit: 255
    t.text     "services"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "operator_id"
    t.boolean  "active",                          default: true
    t.string   "uuid"
    t.string   "uvair_contract_fuel"
    t.integer  "external_id"
    t.string   "address_line_1"
    t.string   "address_line_2"
    t.string   "city"
    t.string   "zip"
    t.string   "state"
    t.string   "country"
    t.string   "sita_addresses"
  end

  add_index "airport_fbos", ["airport_id"], name: "index_airport_fbos_on_airport_id", using: :btree
  add_index "airport_fbos", ["contact_info_id"], name: "index_airport_fbos_on_contact_info_id", using: :btree
  add_index "airport_fbos", ["operator_id"], name: "index_airport_fbos_on_operator_id", using: :btree
  add_index "airport_fbos", ["uuid"], name: "index_airport_fbos_on_uuid", unique: true, using: :btree

  create_table "airport_fet_precalculated_percentages", force: :cascade do |t|
    t.integer  "from_airport_id"
    t.integer  "to_airport_id"
    t.integer  "distance_outside_us"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "airport_fet_precalculated_percentages", ["from_airport_id"], name: "index_airport_fet_precalculated_percentages_on_from_airport_id", using: :btree

  create_table "airport_instrument_procedure_types", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.integer  "index"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "airport_instrument_procedures", force: :cascade do |t|
    t.integer  "airport_id"
    t.string   "name"
    t.string   "page_1_url"
    t.string   "page_2_url"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "procedure_type_id"
  end

  add_index "airport_instrument_procedures", ["airport_id"], name: "index_airport_instrument_procedures_on_airport_id", using: :btree

  create_table "airport_nearby", force: :cascade do |t|
    t.integer  "airport_id"
    t.integer  "nearby_airport_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "airport_nearby", ["airport_id"], name: "index_airport_nearby_on_airport_id", using: :btree
  add_index "airport_nearby", ["nearby_airport_id"], name: "index_airport_nearby_on_nearby_airport_id", using: :btree

  create_table "airport_operator_preferences", force: :cascade do |t|
    t.integer  "airport_id"
    t.integer  "operator_id"
    t.integer  "airport_fbo_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "airport_operator_preferences", ["airport_fbo_id"], name: "index_airport_operator_preferences_on_airport_fbo_id", using: :btree
  add_index "airport_operator_preferences", ["airport_id"], name: "index_airport_operator_preferences_on_airport_id", using: :btree
  add_index "airport_operator_preferences", ["operator_id"], name: "index_airport_operator_preferences_on_operator_id", using: :btree

  create_table "airport_runways", force: :cascade do |t|
    t.integer  "airport_id"
    t.string   "name",                                  limit: 255
    t.integer  "length"
    t.integer  "width"
    t.string   "surface",                               limit: 255
    t.string   "lights",                                limit: 255
    t.string   "ils",                                   limit: 255
    t.string   "navaids",                               limit: 255
    t.string   "pcn",                                   limit: 255
    t.integer  "index"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "base_end_displaced_threshold"
    t.integer  "reciprocol_end_displaced_threshold"
    t.integer  "wbc_single_wheel_aircraft"
    t.integer  "wbc_dual_wheel_aircraft"
    t.integer  "wbc_dual_tandem_wheel_aircraft"
    t.integer  "wbc_double_dual_tandem_wheel_aircraft"
  end

  add_index "airport_runways", ["airport_id"], name: "index_airport_runways_on_airport_id", using: :btree

  create_table "airports", force: :cascade do |t|
    t.string    "airport_type",                     limit: 255
    t.string    "landing_facility_type",            limit: 255
    t.boolean   "slots_required"
    t.boolean   "handling_mandatory"
    t.integer   "elevation"
    t.string    "hours_of_operation",               limit: 255
    t.string    "time_zone",                        limit: 255
    t.string    "utc_time",                         limit: 255
    t.boolean   "fuel_jet_available"
    t.boolean   "landing_fee_required"
    t.boolean   "has_customs"
    t.string    "customs_location",                 limit: 255
    t.string    "customs_phone",                    limit: 255
    t.string    "fss_name",                         limit: 255
    t.string    "fss_phone",                        limit: 255
    t.string    "agriculture_phone",                limit: 255
    t.string    "arff",                             limit: 255
    t.string    "magnetic",                         limit: 255
    t.string    "closest_city_name",                limit: 255
    t.string    "closest_city_distance",            limit: 255
    t.string    "closest_city_business_distance",   limit: 255
    t.string    "closest_city_business_directions", limit: 255
    t.integer   "extid"
    t.string    "manager_name",                     limit: 255
    t.string    "manager_phone",                    limit: 255
    t.string    "owner_name",                       limit: 255
    t.string    "owner_street",                     limit: 255
    t.string    "owner_address",                    limit: 255
    t.string    "tower_phone",                      limit: 255
    t.string    "atis_phone",                       limit: 255
    t.string    "awos_phone",                       limit: 255
    t.string    "freq_tower",                       limit: 255
    t.string    "freq_gnd",                         limit: 255
    t.string    "freq_unicom",                      limit: 255
    t.string    "freq_atis",                        limit: 255
    t.string    "freq_awos",                        limit: 255
    t.string    "freq_awos_type",                   limit: 255
    t.datetime  "created_at"
    t.datetime  "updated_at"
    t.string    "latitude",                         limit: 255
    t.string    "longitude",                        limit: 255
    t.string    "name",                             limit: 255
    t.string    "icao",                             limit: 255
    t.string    "iata",                             limit: 255
    t.string    "faa",                              limit: 255
    t.string    "location",                         limit: 255
    t.string    "slug",                             limit: 255,                                                              null: false
    t.string    "display_name",                     limit: 255
    t.string    "asos_phone"
    t.string    "freq_clr_del1"
    t.string    "freq_clr_del2"
    t.string    "short_display_name"
    t.integer   "autocomplete_score"
    t.string    "airport_diagram_url"
    t.datetime  "airnav_updated_at"
    t.boolean   "fuel_avgas_100_available"
    t.boolean   "fuel_avgas_80_available"
    t.string    "state"
    t.string    "country"
    t.string    "freq_asos"
    t.string    "freq_dep"
    t.string    "freq_appr"
    t.string    "immigration_phone"
    t.string    "ppr"
    t.string    "airport_usage"
    t.string    "ownership"
    t.boolean   "rural"
    t.string    "landing_facility_identifier"
    t.string    "owner_city"
    t.string    "owner_location"
    t.string    "state_code"
    t.string    "country_code"
    t.string    "airport_of_entry"
    t.boolean   "united_states_within_225",                                                                  default: false
    t.boolean   "part_139",                                                                                  default: false
    t.integer   "closest_part_139_airport_id"
    t.geography "lonlat",                           limit: {:srid=>4326, :type=>"point", :geographic=>true}
  end

  add_index "airports", ["display_name"], name: "index_airports_on_display_name", using: :gin
  add_index "airports", ["faa"], name: "index_airports_on_faa", using: :btree
  add_index "airports", ["iata"], name: "index_airports_on_iata", using: :btree
  add_index "airports", ["icao"], name: "index_airports_on_icao", using: :btree
  add_index "airports", ["landing_facility_identifier"], name: "index_airports_on_landing_facility_identifier", unique: true, using: :btree
  add_index "airports", ["lonlat"], name: "index_airports_on_lonlat", using: :gist
  add_index "airports", ["slug"], name: "index_airports_on_slug", unique: true, using: :btree

  create_table "airworthiness_releases", force: :cascade do |t|
    t.string   "technician_name"
    t.string   "license_number"
    t.string   "location"
    t.string   "airworthiness_release_pdf_file_name"
    t.integer  "license_type"
    t.integer  "sign_off_e_signature_id"
    t.integer  "logged_by_user_id"
    t.integer  "aircraft_id"
    t.string   "uuid"
    t.datetime "released_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "external_email"
    t.string   "sign_off_uuid"
  end

  add_index "airworthiness_releases", ["aircraft_id"], name: "index_airworthiness_releases_on_aircraft_id", using: :btree
  add_index "airworthiness_releases", ["logged_by_user_id"], name: "index_airworthiness_releases_on_logged_by_user_id", using: :btree
  add_index "airworthiness_releases", ["uuid"], name: "index_airworthiness_releases_on_uuid", unique: true, using: :btree

  create_table "audits", force: :cascade do |t|
    t.integer  "auditable_id"
    t.string   "auditable_type"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "username"
    t.string   "action"
    t.text     "audited_changes"
    t.integer  "version",         default: 0
    t.string   "comment"
    t.string   "remote_address"
    t.string   "request_uuid"
    t.datetime "created_at"
  end

  add_index "audits", ["associated_id", "associated_type"], name: "associated_index", using: :btree
  add_index "audits", ["auditable_id", "auditable_type"], name: "auditable_index", using: :btree
  add_index "audits", ["created_at"], name: "index_audits_on_created_at", using: :btree
  add_index "audits", ["request_uuid"], name: "index_audits_on_request_uuid", using: :btree
  add_index "audits", ["user_id", "user_type"], name: "user_index", using: :btree

  create_table "broadcast_messages", force: :cascade do |t|
    t.string   "subdomain"
    t.text     "message"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "disable_site_for_maintenance", default: false
  end

  create_table "companies", force: :cascade do |t|
    t.integer  "operator_id"
    t.string   "name"
    t.string   "address1"
    t.string   "address2"
    t.string   "address3"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "uuid"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "phone1"
  end

  add_index "companies", ["name"], name: "index_companies_on_name", using: :btree
  add_index "companies", ["operator_id"], name: "index_companies_on_operator_id", using: :btree
  add_index "companies", ["operator_id"], name: "index_companies_on_operator_id_and_lower_name", unique: true, using: :btree
  add_index "companies", ["uuid"], name: "index_companies_on_uuid", unique: true, using: :btree

  create_table "contact_infos", force: :cascade do |t|
    t.string   "first_name",      limit: 255,                 null: false
    t.string   "middle_name",     limit: 255
    t.string   "last_name",       limit: 255,                 null: false
    t.string   "address1"
    t.string   "address2",        limit: 255
    t.string   "address3",        limit: 255
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country",         limit: 255, default: "USA"
    t.string   "phone1"
    t.integer  "phone1_type_id"
    t.string   "phone2",          limit: 255
    t.integer  "phone2_type_id"
    t.string   "phone3",          limit: 255
    t.integer  "phone3_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "company",         limit: 255
    t.string   "email"
    t.string   "preferred_name"
    t.string   "salutation"
    t.integer  "salutation_type",             default: 0
  end

  create_table "cost_pricing_line_items", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "airport_id"
    t.integer  "airport_fbo_id"
    t.integer  "line_item_type_id"
    t.integer  "value"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "aircraft_type_id"
    t.integer  "waived_with_fuel_gallons"
    t.integer  "waived_with_fuel_units_waived"
    t.datetime "data_last_sourced_at"
  end

  add_index "cost_pricing_line_items", ["aircraft_type_id"], name: "index_cost_pricing_line_items_on_aircraft_type_id", using: :btree
  add_index "cost_pricing_line_items", ["airport_fbo_id"], name: "index_cost_pricing_line_items_on_airport_fbo_id", using: :btree
  add_index "cost_pricing_line_items", ["airport_id"], name: "index_cost_pricing_line_items_on_airport_id", using: :btree
  add_index "cost_pricing_line_items", ["line_item_type_id"], name: "index_cost_pricing_line_items_on_line_item_type_id", using: :btree
  add_index "cost_pricing_line_items", ["operator_id"], name: "index_cost_pricing_line_items_on_operator_id", using: :btree

  create_table "customer_delegates", force: :cascade do |t|
    t.integer  "grantor_id"
    t.integer  "recipient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "customer_delegates", ["grantor_id"], name: "index_customer_delegates_on_grantor_id", using: :btree
  add_index "customer_delegates", ["recipient_id"], name: "index_customer_delegates_on_recipient_id", using: :btree

  create_table "customer_passengers", force: :cascade do |t|
    t.integer  "customer_id",  null: false
    t.integer  "passenger_id", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "customer_passengers", ["customer_id"], name: "index_customer_passengers_on_customer_id", using: :btree
  add_index "customer_passengers", ["passenger_id"], name: "index_customer_passengers_on_passenger_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "user_id"
    t.integer  "contact_info_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "is_broker"
    t.string   "uuid"
    t.text     "crew_itinerary_notes"
    t.integer  "company_id"
    t.integer  "wire_account_number_suffix"
    t.string   "email"
    t.text     "internal_profile"
    t.boolean  "planner_only",               default: false
  end

  add_index "customers", ["contact_info_id"], name: "index_customers_on_contact_info_id", using: :btree
  add_index "customers", ["operator_id", "email"], name: "index_customers_on_operator_id_and_email", unique: true, using: :btree
  add_index "customers", ["operator_id", "wire_account_number_suffix"], name: "index_customers_on_operator_id_and_wire_account_number_suffix", unique: true, using: :btree
  add_index "customers", ["operator_id"], name: "index_customers_on_operator_id", using: :btree
  add_index "customers", ["user_id"], name: "index_customers_on_user_id", using: :btree
  add_index "customers", ["uuid"], name: "index_customers_on_uuid", unique: true, using: :btree

  create_table "discrepancies", force: :cascade do |t|
    t.datetime "found_on_date"
    t.text     "details"
    t.string   "issue"
    t.integer  "found_by_user_id"
    t.integer  "aircraft_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "uuid"
    t.integer  "logged_by_user_id"
    t.string   "discrepancy_pdf_file_name"
  end

  add_index "discrepancies", ["aircraft_id"], name: "index_discrepancies_on_aircraft_id", using: :btree
  add_index "discrepancies", ["found_by_user_id"], name: "index_discrepancies_on_found_by_user_id", using: :btree
  add_index "discrepancies", ["uuid"], name: "index_discrepancies_on_uuid", unique: true, using: :btree

  create_table "e_signatures", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "user_id"
    t.integer  "digest_type"
    t.string   "digest"
    t.integer  "payload_type"
    t.integer  "payload_version"
    t.text     "payload"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "eapis_flight_segments", force: :cascade do |t|
    t.integer  "eapis_message_id"
    t.string   "transport_identifier"
    t.integer  "departure_airport_id"
    t.datetime "departure_datetime"
    t.integer  "arrival_airport_id"
    t.datetime "arrival_datetime"
    t.integer  "segment_index"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "eapis_messages", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "event_id"
    t.text     "message_text"
    t.integer  "message_type"
    t.string   "message_reference_identifier"
    t.string   "interchange_reference_identifier"
    t.datetime "message_sent_at"
    t.datetime "response_received_at"
    t.datetime "message_approved_at"
    t.boolean  "active"
    t.string   "uuid"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "eapis_passengers", force: :cascade do |t|
    t.integer  "eapis_message_id"
    t.integer  "passenger_id"
    t.integer  "event_flight_personnel_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "middle_name"
    t.string   "stay_address"
    t.string   "stay_city"
    t.string   "stay_state"
    t.string   "stay_postal_code"
    t.string   "stay_country"
    t.integer  "gender"
    t.integer  "passenger_type"
    t.datetime "dob"
    t.boolean  "info_validated"
    t.string   "airport_of_arrival"
    t.string   "country_of_residence"
    t.string   "country_of_citizenship"
    t.string   "country_of_birth"
    t.string   "city_of_birth"
    t.string   "sub_country_of_birth"
    t.string   "phone_number"
    t.integer  "travel_document_type"
    t.string   "travel_document_identifier"
    t.datetime "travel_document_expiration"
    t.string   "travel_document_issuing_country"
    t.string   "pilot_license_identifier"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "email_events", force: :cascade do |t|
    t.string   "sg_event_id"
    t.string   "message_uuid"
    t.string   "event_kind"
    t.string   "to"
    t.text     "event_data"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "email_events", ["sg_event_id"], name: "index_sg_event_id_on_emails", unique: true, using: :btree

  create_table "event_colors", force: :cascade do |t|
    t.string   "name"
    t.string   "background_hex"
    t.string   "text_hex"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "event_feed_aircrafts", force: :cascade do |t|
    t.integer  "event_feed_id", null: false
    t.integer  "aircraft_id",   null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "event_feed_aircrafts", ["aircraft_id"], name: "index_event_feed_aircrafts_on_aircraft_id", using: :btree
  add_index "event_feed_aircrafts", ["event_feed_id"], name: "index_event_feed_aircrafts_on_event_feed_id", using: :btree

  create_table "event_feed_personnels", force: :cascade do |t|
    t.integer  "flight_personnel_id", null: false
    t.integer  "event_feed_id",       null: false
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "event_feed_personnels", ["event_feed_id"], name: "index_event_feed_personnels_on_event_feed_id", using: :btree
  add_index "event_feed_personnels", ["flight_personnel_id"], name: "index_event_feed_personnels_on_flight_personnel_id", using: :btree

  create_table "event_feeds", force: :cascade do |t|
    t.uuid     "uuid",                                       null: false
    t.string   "name",                                       null: false
    t.integer  "operator_id",                                null: false
    t.boolean  "all",                        default: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.boolean  "active",                     default: true
    t.boolean  "is_personnel",               default: false
    t.integer  "user_id"
    t.text     "last_gsync_error_message"
    t.datetime "last_gsync_error_timestamp"
  end

  add_index "event_feeds", ["operator_id"], name: "index_event_feeds_on_operator_id", using: :btree
  add_index "event_feeds", ["user_id"], name: "index_event_feeds_on_user_id", using: :btree

  create_table "event_flight_personnel_role_qualifications", force: :cascade do |t|
    t.integer  "flight_personnel_id"
    t.integer  "aircraft_id"
    t.integer  "event_flight_personnel_role_id"
    t.boolean  "all_aircraft"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "event_flight_personnel_role_qualifications", ["aircraft_id"], name: "index_event_flight_personnel_role_qualifications_on_aircraft_id", using: :btree
  add_index "event_flight_personnel_role_qualifications", ["flight_personnel_id"], name: "index_efp_role_qualifications_on_flight_personnel_id", using: :btree

  create_table "event_flight_personnel_roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "flight_personnel_role_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "index"
    t.string   "display_name"
  end

  create_table "event_flight_personnels", force: :cascade do |t|
    t.integer  "event_id"
    t.integer  "flight_personnel_id"
    t.integer  "event_flight_personnel_role_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "temporary_flight_personnel_id"
  end

  add_index "event_flight_personnels", ["event_flight_personnel_role_id"], name: "index_event_flight_personnels_on_event_flight_personnel_role_id", using: :btree
  add_index "event_flight_personnels", ["event_id"], name: "index_event_flight_personnels_on_event_id", using: :btree
  add_index "event_flight_personnels", ["flight_personnel_id"], name: "index_event_flight_personnels_on_flight_personnel_id", using: :btree
  add_index "event_flight_personnels", ["temporary_flight_personnel_id"], name: "index_event_flight_personnels_on_temporary_flight_personnel_id", using: :btree

  create_table "event_passengers", force: :cascade do |t|
    t.integer  "event_id",                             null: false
    t.integer  "passenger_id",                         null: false
    t.decimal  "bag_weight",   precision: 7, scale: 2
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "event_passengers", ["event_id"], name: "index_event_passengers_on_event_id", using: :btree
  add_index "event_passengers", ["passenger_id"], name: "index_event_passengers_on_passenger_id", using: :btree

  create_table "event_services", force: :cascade do |t|
    t.integer  "event_id"
    t.boolean  "for_crew"
    t.string   "confirmation_code"
    t.string   "google_id"
    t.integer  "provider_contact_info_id"
    t.text     "provider_url"
    t.text     "notes"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "event_services", ["event_id"], name: "index_event_services_on_event_id", using: :btree

  create_table "event_types", force: :cascade do |t|
    t.string   "name"
    t.string   "display_text"
    t.boolean  "is_ground",                      default: false
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "is_editable",                    default: false
    t.string   "schedule_css_non_resource_view"
    t.boolean  "for_aircraft"
    t.boolean  "for_personnel"
    t.integer  "index"
    t.boolean  "active",                         default: true
    t.boolean  "origin_allowed"
    t.boolean  "destination_allowed"
    t.boolean  "origin_required"
    t.boolean  "destination_required"
    t.string   "background_hex"
    t.string   "text_hex"
    t.string   "calendar_group"
    t.string   "calendar_select_text"
    t.string   "schedule_css_resource_view"
  end

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.datetime "start"
    t.integer  "duration_minutes"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.integer  "aircraft_id"
    t.boolean  "is_hold",                                    default: false
    t.integer  "trip_id"
    t.integer  "event_type_id"
    t.integer  "operator_id"
    t.text     "notes"
    t.integer  "trip_quote_segment_id"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "uuid"
    t.text     "crew_segment_notes_other"
    t.boolean  "active",                                     default: true
    t.integer  "pax",                                        default: 0
    t.integer  "faa_regs_part_number",                       default: 0
    t.integer  "aircraft_flight_log_id"
    t.text     "crew_segment_notes_from_system_destination"
    t.text     "crew_segment_notes_fuel"
    t.text     "crew_segment_notes_catering"
    t.text     "crew_segment_notes_transportation"
    t.text     "pax_segment_notes_other"
    t.text     "pax_segment_notes_catering"
    t.text     "pax_segment_notes_transportation"
    t.string   "trip_pnr"
    t.boolean  "show_crew_segment_notes_from_system",        default: true
    t.text     "crew_segment_notes_fbo"
    t.text     "operator_crew_text_for_brokered_aircraft"
    t.boolean  "flight_actual_created",                      default: false
    t.boolean  "time_is_tbd",                                default: false
    t.text     "crew_segment_notes_from_system_origin"
    t.integer  "fuel_price_source"
    t.integer  "origin_fbo_id"
    t.integer  "destination_fbo_id"
  end

  add_index "events", ["aircraft_flight_log_id"], name: "index_events_on_aircraft_flight_log_id", using: :btree
  add_index "events", ["aircraft_id"], name: "index_events_on_aircraft_id", using: :btree
  add_index "events", ["destination_id"], name: "index_events_on_destination_id", using: :btree
  add_index "events", ["event_type_id"], name: "index_events_on_event_type_id", using: :btree
  add_index "events", ["operator_id"], name: "index_events_on_operator_id", using: :btree
  add_index "events", ["origin_id"], name: "index_events_on_origin_id", using: :btree
  add_index "events", ["trip_id"], name: "index_events_on_trip_id", using: :btree
  add_index "events", ["trip_quote_segment_id"], name: "index_events_on_trip_quote_segment_id", using: :btree
  add_index "events", ["uuid"], name: "index_events_on_uuid", unique: true, using: :btree

  create_table "fbo_name_substitution_for_fuel_sheets", force: :cascade do |t|
    t.integer  "fuel_price_source"
    t.string   "find"
    t.string   "replace"
    t.integer  "only_for_airport_id"
    t.integer  "index"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "fbo_name_substitution_for_fuel_sheets", ["fuel_price_source"], name: "index_fbo_name_substitution_on_source", using: :btree
  add_index "fbo_name_substitution_for_fuel_sheets", ["index"], name: "index_fbo_name_substitution_for_fuel_sheets_on_index", using: :btree

  create_table "financial_transactions", force: :cascade do |t|
    t.string   "source_type_id"
    t.string   "kind_id"
    t.text     "description"
    t.decimal  "amount",                 precision: 9, scale: 2
    t.datetime "posted_datetime"
    t.integer  "trip_id"
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
    t.integer  "payment_source_id"
    t.boolean  "succeeded"
    t.text     "payment_processor_data"
    t.string   "status_id"
    t.boolean  "post_flight_invoice",                            default: false
    t.integer  "customer_id"
    t.string   "uuid"
    t.text     "failure_reason"
    t.decimal  "application_fee",        precision: 8, scale: 2
    t.string   "payment_processor_id"
    t.integer  "refund_for_id"
    t.integer  "capture_for_id"
    t.integer  "created_by_user_id"
  end

  add_index "financial_transactions", ["customer_id"], name: "index_financial_transactions_on_customer_id", using: :btree
  add_index "financial_transactions", ["kind_id"], name: "index_financial_transactions_on_kind_id", using: :btree
  add_index "financial_transactions", ["payment_processor_id"], name: "index_financial_transactions_on_payment_processor_id", using: :btree
  add_index "financial_transactions", ["payment_source_id"], name: "index_financial_transactions_on_payment_source_id", using: :btree
  add_index "financial_transactions", ["source_type_id"], name: "index_financial_transactions_on_source_type_id", using: :btree
  add_index "financial_transactions", ["status_id"], name: "index_financial_transactions_on_status_id", using: :btree
  add_index "financial_transactions", ["trip_id"], name: "index_financial_transactions_on_trip_id", using: :btree
  add_index "financial_transactions", ["uuid"], name: "index_financial_transactions_on_uuid", unique: true, using: :btree

  create_table "flight_actual_personnel_approaches", force: :cascade do |t|
    t.integer  "flight_actual_personnel_id"
    t.integer  "approach_type"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "flight_actual_personnel_approaches", ["flight_actual_personnel_id"], name: "index_flight_actual_prsnl_apprs_on_flight_actual_prsnl_id", using: :btree

  create_table "flight_actual_personnels", force: :cascade do |t|
    t.integer  "flight_actual_id"
    t.integer  "flight_personnel_id"
    t.integer  "temporary_flight_personnel_id"
    t.integer  "event_flight_personnel_role_id"
    t.boolean  "pic_qualified_for_aircraft",                             default: false
    t.datetime "start"
    t.boolean  "pilot_flying",                                           default: false
    t.boolean  "pilot_monitoring",                                       default: false
    t.decimal  "pic_hours",                      precision: 4, scale: 2
    t.decimal  "sic_hours",                      precision: 4, scale: 2
    t.decimal  "instrument_hours",               precision: 4, scale: 2
    t.decimal  "night_hours",                    precision: 4, scale: 2
    t.integer  "day_takeoffs"
    t.integer  "night_takeoffs"
    t.integer  "day_landings"
    t.integer  "night_landings"
    t.integer  "holds"
    t.datetime "created_at",                                                             null: false
    t.datetime "updated_at",                                                             null: false
  end

  add_index "flight_actual_personnels", ["flight_actual_id"], name: "index_flight_actual_personnels_on_flight_actual_id", using: :btree
  add_index "flight_actual_personnels", ["flight_personnel_id"], name: "index_flight_actual_personnels_on_flight_personnel_id", using: :btree
  add_index "flight_actual_personnels", ["start"], name: "index_flight_actual_personnels_on_start", using: :btree

  create_table "flight_actuals", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "trip_id"
    t.integer  "aircraft_id"
    t.integer  "aircraft_flight_log_id"
    t.boolean  "pre_flight_complete",                                      default: false
    t.boolean  "post_flight_complete",                                     default: false
    t.integer  "pax",                                                      default: 0
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.datetime "scheduled_departure"
    t.datetime "scheduled_arrival"
    t.integer  "gallons_added"
    t.decimal  "cg_measurement",                   precision: 6, scale: 2
    t.decimal  "cg_forward_limit",                 precision: 6, scale: 2
    t.decimal  "cg_aft_limit",                     precision: 6, scale: 2
    t.integer  "max_take_off_weight"
    t.boolean  "weight_and_balance_in_limits"
    t.date     "vor_check_completed_on"
    t.string   "vor_check_location"
    t.integer  "vor_check_bearing_1"
    t.integer  "vor_check_bearing_2"
    t.integer  "vor_check_bearing_1_error"
    t.integer  "vor_check_bearing_2_error"
    t.boolean  "vor_check_in_limits"
    t.datetime "time_out"
    t.datetime "time_off"
    t.datetime "time_on"
    t.datetime "time_in"
    t.decimal  "hobbs_out",                        precision: 8, scale: 2
    t.decimal  "hobbs_in",                         precision: 8, scale: 2
    t.integer  "fuel_out"
    t.integer  "fuel_in"
    t.integer  "take_off_weight"
    t.integer  "faa_regs_part_number",                                     default: 0
    t.decimal  "airframe_hours",                   precision: 4, scale: 2
    t.integer  "airframe_cycles"
    t.decimal  "engine_1_hours",                   precision: 4, scale: 2
    t.decimal  "engine_2_hours",                   precision: 4, scale: 2
    t.decimal  "engine_3_hours",                   precision: 4, scale: 2
    t.integer  "engine_1_cycles"
    t.integer  "engine_2_cycles"
    t.integer  "engine_3_cycles"
    t.decimal  "apu_1_hours",                      precision: 4, scale: 2
    t.integer  "apu_1_cycles"
    t.integer  "trip_service_issue_type_id"
    t.text     "service_issues"
    t.integer  "service_issue_acknowledged_by_id"
    t.datetime "service_issue_acknowledged_on"
    t.integer  "marked_complete_by_id"
    t.datetime "marked_complete_on"
    t.datetime "created_at",                                                               null: false
    t.datetime "updated_at",                                                               null: false
    t.boolean  "pilot_actuals_free_form_edit",                             default: false
    t.integer  "vor_check_e_signature_id"
    t.decimal  "cg_measurement_percent",           precision: 5, scale: 2
    t.decimal  "cg_forward_limit_percent",         precision: 5, scale: 2
    t.decimal  "cg_aft_limit_percent",             precision: 5, scale: 2
  end

  add_index "flight_actuals", ["aircraft_flight_log_id"], name: "index_flight_actuals_on_aircraft_flight_log_id", using: :btree
  add_index "flight_actuals", ["aircraft_id"], name: "index_flight_actuals_on_aircraft_id", using: :btree
  add_index "flight_actuals", ["operator_id"], name: "index_flight_actuals_on_operator_id", using: :btree
  add_index "flight_actuals", ["trip_id"], name: "index_flight_actuals_on_trip_id", using: :btree
  add_index "flight_actuals", ["vor_check_completed_on"], name: "index_flight_actuals_on_vor_check_completed_on", using: :btree

  create_table "flight_personnel_document_types", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.boolean  "active",                   default: true
    t.integer  "flight_personnel_role_id"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.boolean  "confidential",             default: true
  end

  create_table "flight_personnel_documents", force: :cascade do |t|
    t.string   "display_name"
    t.string   "uuid"
    t.integer  "flight_personnel_id"
    t.integer  "flight_personnel_document_type_id"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
    t.boolean  "active",                            default: true
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "flight_personnel_documents", ["flight_personnel_id"], name: "index_flight_personnel_documents_on_flight_personnel_id", using: :btree
  add_index "flight_personnel_documents", ["uuid"], name: "index_flight_personnel_documents_on_uuid", using: :btree

  create_table "flight_personnel_duty_days", force: :cascade do |t|
    t.integer  "flight_personnel_id"
    t.integer  "trip_id"
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "operator_id"
    t.integer  "flight_time_135_mins"
    t.integer  "flight_time_other_commercial_mins"
    t.text     "remarks"
    t.integer  "pilot_duty_day_type_id"
  end

  add_index "flight_personnel_duty_days", ["flight_personnel_id"], name: "index_flight_personnel_duty_days_on_flight_personnel_id", using: :btree
  add_index "flight_personnel_duty_days", ["operator_id"], name: "index_flight_personnel_duty_days_on_operator_id", using: :btree
  add_index "flight_personnel_duty_days", ["trip_id"], name: "index_flight_personnel_duty_days_on_trip_id", using: :btree

  create_table "flight_personnel_roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "flight_personnel_roles", ["name"], name: "index_flight_personnel_roles_on_name", unique: true, using: :btree

  create_table "flight_personnels", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "user_id"
    t.integer  "flight_personnel_role_id"
    t.integer  "event_color_id"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.boolean  "active",                            default: true
    t.string   "uuid"
    t.string   "country_of_residence"
    t.string   "country_of_passport"
    t.string   "passport_number"
    t.date     "passport_expiration"
    t.date     "date_of_birth"
    t.string   "certificate_number"
    t.date     "certificate_issue_date"
    t.datetime "duty_day_timer_start"
    t.integer  "certificate_type"
    t.datetime "tfssp_manually_cleared_at"
    t.text     "tfssp_clearance_notes",             default: ""
    t.integer  "tfssp_manually_cleared_by_user_id"
    t.integer  "sort_index"
    t.integer  "home_base_id"
    t.string   "birthplace_city"
    t.string   "birthplace_subregion"
    t.string   "birthplace_country"
  end

  add_index "flight_personnels", ["flight_personnel_role_id"], name: "index_flight_personnels_on_flight_personnel_role_id", using: :btree
  add_index "flight_personnels", ["operator_id"], name: "index_flight_personnels_on_operator_id", using: :btree
  add_index "flight_personnels", ["user_id"], name: "index_flight_personnels_on_user_id", using: :btree
  add_index "flight_personnels", ["uuid"], name: "index_flight_personnels_on_uuid", unique: true, using: :btree

  create_table "fly_list_import_statuses", force: :cascade do |t|
    t.integer  "operator_id"
    t.string   "fly_list_type"
    t.string   "fly_list_version"
    t.string   "status"
    t.boolean  "archived",         default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "fly_list_import_statuses", ["operator_id"], name: "index_fly_list_import_statuses_on_operator_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",           limit: 255, null: false
    t.integer  "sluggable_id",               null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope",          limit: 255
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "guest_users", force: :cascade do |t|
    t.string   "email"
    t.string   "confirmation_token"
    t.string   "session_token"
    t.string   "payment_processor_customer_token"
    t.datetime "confirmed_at"
    t.boolean  "active",                           default: true
    t.inet     "last_sign_in_ip"
    t.integer  "trip_id"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "full_name"
  end

  add_index "guest_users", ["email"], name: "index_guest_users_on_email", using: :btree
  add_index "guest_users", ["session_token"], name: "index_guest_users_on_session_token", using: :btree

  create_table "institution_infos", force: :cascade do |t|
    t.string   "name"
    t.text     "logo_url"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "disabled",   default: false
  end

  add_index "institution_infos", ["name"], name: "index_institution_infos_on_name", using: :btree

  create_table "job_run_logs", force: :cascade do |t|
    t.string   "job_name"
    t.integer  "last_processed_id", default: 0
    t.datetime "last_run_datetime"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "job_run_logs", ["job_name"], name: "index_job_run_logs_on_job_name", using: :btree

  create_table "maintenance_sign_offs", force: :cascade do |t|
    t.datetime "fixed_on_date"
    t.string   "name"
    t.string   "license_number"
    t.text     "corrective_action"
    t.integer  "license_type"
    t.integer  "sign_off_e_signature_id"
    t.integer  "discrepancy_id"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "uuid"
    t.decimal  "airframe_hours",                     precision: 8, scale: 2
    t.integer  "airframe_cycles"
    t.decimal  "engine_1_hours",                     precision: 8, scale: 2
    t.decimal  "engine_2_hours",                     precision: 8, scale: 2
    t.decimal  "engine_3_hours",                     precision: 8, scale: 2
    t.integer  "engine_1_cycles"
    t.integer  "engine_2_cycles"
    t.integer  "engine_3_cycles"
    t.decimal  "apu_1_hours",                        precision: 8, scale: 2
    t.integer  "apu_1_cycles"
    t.integer  "signed_by_user_id"
    t.string   "location"
    t.datetime "marked_approved_on"
    t.integer  "marked_approved_by_id"
    t.boolean  "marked_approved"
    t.text     "maintenance_rejection_reason"
    t.string   "maintenance_sign_off_pdf_file_name"
    t.string   "external_email"
  end

  add_index "maintenance_sign_offs", ["discrepancy_id"], name: "index_maintenance_sign_offs_on_discrepancy_id", using: :btree
  add_index "maintenance_sign_offs", ["uuid"], name: "index_maintenance_sign_offs_on_uuid", unique: true, using: :btree

  create_table "market_airports", force: :cascade do |t|
    t.integer   "airport_id"
    t.text      "content"
    t.datetime  "created_at",                                                                         null: false
    t.datetime  "updated_at",                                                                         null: false
    t.string    "slug"
    t.string    "name"
    t.string    "title"
    t.string    "subtitle"
    t.float     "latitude"
    t.float     "longitude"
    t.geography "lonlat",     limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.boolean   "active",                                                              default: true
  end

  add_index "market_airports", ["airport_id"], name: "index_market_airports_on_airport_id", using: :btree
  add_index "market_airports", ["lonlat"], name: "index_market_airports_on_lonlat", using: :gist

  create_table "market_experiences", force: :cascade do |t|
    t.string    "slug"
    t.string    "name"
    t.string    "subtitle"
    t.text      "content"
    t.string    "title"
    t.datetime  "start_datetime"
    t.datetime  "end_datetime"
    t.datetime  "created_at",                                                                             null: false
    t.datetime  "updated_at",                                                                             null: false
    t.float     "latitude"
    t.float     "longitude"
    t.geography "lonlat",         limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.boolean   "active",                                                                  default: true
  end

  add_index "market_experiences", ["lonlat"], name: "index_market_experiences_on_lonlat", using: :gist
  add_index "market_experiences", ["slug"], name: "index_market_experiences_on_slug", using: :btree

  create_table "market_images", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "has_image_id"
    t.string   "has_image_type"
    t.integer  "index"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "uuid"
    t.string   "image_content_type"
  end

  add_index "market_images", ["has_image_id", "has_image_type", "index"], name: "index_market_images_on_type_id_and_index", unique: true, using: :btree
  add_index "market_images", ["has_image_type", "has_image_id"], name: "index_market_images_on_has_image_type_and_has_image_id", using: :btree
  add_index "market_images", ["index"], name: "index_market_images_on_index", using: :btree
  add_index "market_images", ["uuid"], name: "index_market_images_on_uuid", unique: true, using: :btree

  create_table "market_locations", force: :cascade do |t|
    t.string    "slug"
    t.string    "name"
    t.string    "subtitle"
    t.text      "content"
    t.datetime  "created_at",                                                                         null: false
    t.datetime  "updated_at",                                                                         null: false
    t.float     "latitude"
    t.float     "longitude"
    t.geography "lonlat",     limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.boolean   "active",                                                              default: true
  end

  add_index "market_locations", ["lonlat"], name: "index_market_locations_on_lonlat", using: :gist
  add_index "market_locations", ["slug"], name: "index_market_locations_on_slug", using: :btree

  create_table "market_question_types", force: :cascade do |t|
    t.text     "question_template"
    t.string   "name"
    t.integer  "index"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "market_questions", force: :cascade do |t|
    t.text     "answer_text"
    t.integer  "market_question_type_id"
    t.integer  "has_question_id"
    t.string   "has_question_type"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "market_questions", ["has_question_type", "has_question_id"], name: "index_market_questions_on_has_question_type_and_has_question_id", using: :btree
  add_index "market_questions", ["market_question_type_id"], name: "index_market_questions_on_market_question_type_id", using: :btree

  create_table "market_suggested_airports", force: :cascade do |t|
    t.integer  "airport_id"
    t.integer  "has_suggested_airport_id"
    t.string   "has_suggested_airport_type"
    t.integer  "index"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "market_suggested_airports", ["airport_id"], name: "index_market_suggested_airports_on_airport_id", using: :btree
  add_index "market_suggested_airports", ["has_suggested_airport_type", "has_suggested_airport_id"], name: "index_on_has_suggested_airport_type_and_id", using: :btree
  add_index "market_suggested_airports", ["index"], name: "index_market_suggested_airports_on_index", using: :btree

  create_table "message_template_categories", force: :cascade do |t|
    t.string   "name"
    t.string   "display_text"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "index"
    t.boolean  "retail_wholesale_split", default: true
  end

  create_table "message_template_types", force: :cascade do |t|
    t.string   "name"
    t.string   "display_text"
    t.integer  "category_id"
    t.integer  "index",        default: 0
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "message_templates", force: :cascade do |t|
    t.integer  "operator_id"
    t.boolean  "is_broker",                default: false
    t.text     "body"
    t.boolean  "active",                   default: true
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "message_template_type_id"
    t.text     "subject"
  end

  add_index "message_templates", ["message_template_type_id"], name: "index_message_templates_on_message_template_type_id", using: :btree
  add_index "message_templates", ["operator_id"], name: "index_message_templates_on_operator_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.text     "body"
    t.integer  "trip_id"
    t.boolean  "from_operator"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.datetime "email_sent_at"
    t.string   "from"
    t.string   "cc"
    t.string   "to"
    t.boolean  "should_send_email",         default: true
    t.string   "subject"
    t.string   "exclude_segments_csl"
    t.string   "uuid"
    t.string   "response_to_source"
    t.text     "html_body"
    t.boolean  "broker_friendly_itinerary", default: false
  end

  add_index "messages", ["trip_id"], name: "index_messages_on_trip_id", using: :btree
  add_index "messages", ["uuid"], name: "index_messages_on_uuid", unique: true, using: :btree

  create_table "minimum_equipment_lists", force: :cascade do |t|
    t.boolean  "operations"
    t.boolean  "maintenance"
    t.text     "maintenance_procedure"
    t.text     "operations_procedure"
    t.string   "license_number"
    t.string   "maintenance_name"
    t.integer  "length_of_deferral"
    t.integer  "category"
    t.integer  "license_type"
    t.integer  "user_id"
    t.integer  "discrepancy_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "sign_off_e_signature_id"
    t.string   "location"
    t.datetime "marked_approved_on"
    t.integer  "marked_approved_by_id"
    t.boolean  "marked_approved"
    t.text     "maintenance_rejection_reason"
    t.datetime "deferral_expiration_date"
    t.string   "item_number"
    t.string   "external_email"
    t.string   "uuid"
  end

  add_index "minimum_equipment_lists", ["discrepancy_id"], name: "index_minimum_equipment_lists_on_discrepancy_id", using: :btree
  add_index "minimum_equipment_lists", ["user_id"], name: "index_minimum_equipment_lists_on_user_id", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "notification_type"
    t.string   "source"
    t.datetime "send_after"
    t.datetime "sent_at"
    t.datetime "send_before"
    t.text     "data"
    t.integer  "associated_id"
    t.string   "associated_type"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.datetime "failed_at"
    t.string   "failure_reason"
  end

  add_index "notifications", ["associated_type", "associated_id"], name: "index_notifications_on_associated_type_and_associated_id", using: :btree

  create_table "notifyees", force: :cascade do |t|
    t.integer  "trip_id"
    t.string   "email"
    t.string   "phone_number"
    t.string   "name"
    t.integer  "operator_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "customer_id"
    t.integer  "user_id"
  end

  add_index "notifyees", ["customer_id"], name: "index_notifyees_on_customer_id", using: :btree
  add_index "notifyees", ["operator_id"], name: "index_notifyees_on_operator_id", using: :btree
  add_index "notifyees", ["trip_id"], name: "index_notifyees_on_trip_id", using: :btree
  add_index "notifyees", ["user_id"], name: "index_notifyees_on_user_id", using: :btree

  create_table "operator_document_options", force: :cascade do |t|
    t.integer  "operator_id"
    t.boolean  "show_pilot_contact_info_on_pax_itinerary",     default: true
    t.boolean  "show_map_on_quote",                            default: true
    t.string   "trip_itinerary_header_bg_dark_hex"
    t.string   "trip_itinerary_header_bg_medium_hex"
    t.string   "trip_itinerary_services_bg_hex"
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.boolean  "show_pos_segments_on_quote",                   default: false
    t.boolean  "show_tail_reg_on_quote_for_own_fleet",         default: false
    t.boolean  "show_tail_reg_on_quote_for_brokered_aircraft", default: false
  end

  add_index "operator_document_options", ["operator_id"], name: "index_operator_document_options_on_operator_id", unique: true, using: :btree

  create_table "operator_document_types", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "index"
  end

  create_table "operator_documents", force: :cascade do |t|
    t.string   "display_name"
    t.string   "uuid"
    t.integer  "operator_id"
    t.integer  "operator_document_type_id"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
    t.boolean  "active",                    default: true
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "operator_documents", ["operator_id"], name: "index_operator_documents_on_operator_id", using: :btree
  add_index "operator_documents", ["uuid"], name: "index_operator_documents_on_uuid", using: :btree

  create_table "operator_enabled_aircraft_currency_types", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "aircraft_currency_type_id"
    t.boolean  "active",                    default: true
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "operator_enabled_aircraft_currency_types", ["operator_id"], name: "index_operator_enabled_aircraft_currency_types_on_operator_id", using: :btree

  create_table "operator_enabled_pilot_currency_types", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "pilot_currency_type_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.integer  "duration"
    t.string   "duration_units"
    t.boolean  "expires_at_month_end"
    t.boolean  "one_month_grace_period"
    t.boolean  "pic_only"
    t.boolean  "sic_only"
    t.boolean  "per_aircraft_type"
    t.boolean  "active",                      default: true
    t.integer  "age_range_year_low"
    t.integer  "age_range_year_high"
    t.boolean  "warn_on_dispatch",            default: true
    t.boolean  "applies_to_pic",              default: true
    t.boolean  "applies_to_sic",              default: true
    t.boolean  "applies_to_sic_safety",       default: false
    t.boolean  "custom_expiration_per_check", default: false
  end

  add_index "operator_enabled_pilot_currency_types", ["operator_id"], name: "index_operator_enabled_pilot_currency_types_on_operator_id", using: :btree

  create_table "operator_expense_mappings", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "expense_category"
    t.integer  "pricing_line_item_type_for_non_brokered_id"
    t.integer  "pricing_line_item_type_for_brokered_id"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "operator_expense_mappings", ["operator_id"], name: "index_operator_expense_mappings_on_operator_id", using: :btree

  create_table "operator_payment_types", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "customer_id"
    t.integer  "payment_type_id"
    t.boolean  "wholesale"
    t.boolean  "allowed"
    t.boolean  "hold_required"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.decimal  "surcharge",       precision: 7, scale: 3
  end

  add_index "operator_payment_types", ["customer_id"], name: "index_operator_payment_types_on_customer_id", using: :btree
  add_index "operator_payment_types", ["operator_id"], name: "index_operator_payment_types_on_operator_id", using: :btree
  add_index "operator_payment_types", ["payment_type_id"], name: "index_operator_payment_types_on_payment_type_id", using: :btree

  create_table "operators", force: :cascade do |t|
    t.integer  "contact_info_id"
    t.integer  "home_base_id"
    t.string   "doc_d085_url",                                           limit: 255
    t.string   "doc_aoc_url",                                            limit: 255
    t.string   "doc_insurance_url",                                      limit: 255
    t.string   "image_logo_url",                                         limit: 255
    t.string   "name",                                                   limit: 255
    t.boolean  "active"
    t.integer  "owner_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",                                                   limit: 255
    t.string   "url",                                                    limit: 255
    t.string   "certificate_holder",                                     limit: 255
    t.string   "certificate_number",                                     limit: 255
    t.text     "admin_comments"
    t.string   "contact_email",                                          limit: 255
    t.string   "notification_email_general",                             limit: 255
    t.string   "terms_pdf_url"
    t.string   "image_large_url"
    t.boolean  "display_address_on_quote",                                                                    default: true
    t.boolean  "beta_features_enabled",                                                                       default: false
    t.integer  "next_booking_number",                                                                         default: 1
    t.string   "quickbooks_oauth_token"
    t.string   "quickbooks_oauth_secret"
    t.string   "quickbooks_oauth_realm_id"
    t.datetime "quickbooks_oauth_renew_on"
    t.datetime "quickbooks_last_sync_started_at"
    t.datetime "quickbooks_last_sync_finished_at"
    t.decimal  "first_aircraft_fee",                                                 precision: 10, scale: 2
    t.decimal  "additional_aircraft_fee",                                            precision: 10, scale: 2
    t.decimal  "credit_card_fee_percentage",                                         precision: 10, scale: 2
    t.decimal  "wire_fee_percentage",                                                precision: 10, scale: 2
    t.decimal  "percentage_of_booked_trips_fee",                                     precision: 10, scale: 2
    t.text     "additional_billing_notes"
    t.integer  "billing_payment_source_id"
    t.boolean  "credit_card_billing_enabled",                                                                 default: false
    t.boolean  "flight_tracking_enabled",                                                                     default: false
    t.integer  "default_part_num_for_pos_leg_before_pax_leg"
    t.integer  "default_part_num_for_pax_leg"
    t.integer  "default_part_num_for_pos_leg_after_pax_leg"
    t.integer  "default_part_num_for_pos_leg_before_pax_leg_owner_trip"
    t.integer  "default_part_num_for_pax_leg_owner_trip"
    t.integer  "default_part_num_for_pos_leg_after_pax_leg_owner_trip"
    t.integer  "auto_archive_trips_after_num_days"
    t.integer  "wire_account_number_prefix"
    t.integer  "charge_days_before_international_trips"
    t.integer  "charge_days_before_low_cost_trips"
    t.integer  "charge_days_before_high_cost_trips"
    t.decimal  "high_cost_trip_threshold",                                           precision: 9,  scale: 2
    t.string   "payment_processor_customer_token"
    t.string   "no_fly_list_version"
    t.string   "cleared_list_version"
    t.string   "selectee_list_version"
    t.boolean  "tfssp_fly_lists_enabled"
    t.boolean  "hide_our_logo_on_quote",                                                                      default: false
    t.boolean  "enabled_admin_flight_tracking",                                                               default: true
    t.datetime "flight_logging_start_date"
    t.boolean  "flight_logging_maintenance_approval_required",                                                default: false
    t.string   "min_to_tenths_rounding_array"
    t.string   "integration_email_uuid"
    t.boolean  "avinode_sync_enabled",                                                                        default: false
    t.integer  "customer_flight_tracking_option"
    t.decimal  "ach_fee_percentage",                                                 precision: 10, scale: 2
    t.integer  "ach_fee_cap_in_dollars"
    t.integer  "wire_fee_cap_in_dollars"
    t.integer  "credit_card_fee_cap_in_dollars"
    t.integer  "aircrafts_count",                                                                             default: 0
    t.integer  "flight_logs_pre_flight_signature_option",                                                     default: 0
    t.integer  "flight_logs_post_flight_signature_option",                                                    default: 0
    t.string   "call_sign_prefix",                                       limit: 5
    t.text     "call_sign_blacklist"
    t.string   "notification_email_accounting",                          limit: 255
    t.string   "notification_email_maintenance",                         limit: 255
    t.boolean  "guest_checkout_enabled"
    t.boolean  "paper_checkout_enabled"
    t.integer  "flight_logs_vor_signature_option",                                                            default: 0
    t.boolean  "contract_fuel_import_enabled",                                                                default: false
  end

  add_index "operators", ["contact_info_id"], name: "index_operators_on_contact_info_id", unique: true, using: :btree
  add_index "operators", ["home_base_id"], name: "index_operators_on_home_base_id", using: :btree
  add_index "operators", ["owner_id"], name: "index_operators_on_owner_id", using: :btree
  add_index "operators", ["slug"], name: "index_operators_on_slug", unique: true, using: :btree

  create_table "passengers", force: :cascade do |t|
    t.integer  "user_id"
    t.boolean  "gender_is_female"
    t.date     "date_of_birth"
    t.integer  "weight"
    t.string   "first_name",                        limit: 255,                null: false
    t.string   "middle_name",                       limit: 255
    t.string   "last_name",                         limit: 255,                null: false
    t.datetime "created_at",                                                   null: false
    t.datetime "updated_at",                                                   null: false
    t.boolean  "active",                                        default: true
    t.string   "country_of_residence"
    t.string   "country_of_passport"
    t.string   "passport_number"
    t.date     "passport_expiration"
    t.string   "phone1"
    t.string   "uuid"
    t.datetime "tfssp_manually_cleared_at"
    t.text     "tfssp_clearance_notes",                         default: ""
    t.integer  "tfssp_manually_cleared_by_user_id"
    t.text     "internal_profile"
    t.text     "crew_itinerary_notes"
  end

  add_index "passengers", ["user_id"], name: "index_passengers_on_user_id", using: :btree
  add_index "passengers", ["uuid"], name: "index_passengers_on_uuid", unique: true, using: :btree

  create_table "payment_processor_events", force: :cascade do |t|
    t.string   "external_id"
    t.string   "object_external_id"
    t.text     "data"
    t.boolean  "succeeded"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "payment_processor_events", ["external_id"], name: "index_payment_processor_events_on_external_id", using: :btree
  add_index "payment_processor_events", ["object_external_id"], name: "index_payment_processor_events_on_object_external_id", using: :btree

  create_table "payment_sources", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "uuid"
    t.string   "payment_processor_token"
    t.integer  "billing_address_id"
    t.integer  "payment_type_id"
    t.string   "last4"
    t.string   "brand"
    t.string   "funding"
    t.string   "country"
    t.integer  "exp_month"
    t.integer  "exp_year"
    t.inet     "ip_address"
    t.boolean  "deleted",                                             default: false
    t.datetime "created_at",                                                          null: false
    t.datetime "updated_at",                                                          null: false
    t.string   "verified_by"
    t.decimal  "account_balance",            precision: 10, scale: 2
    t.string   "plaid_token"
    t.string   "plaid_account_id"
    t.datetime "account_balance_updated_at"
    t.integer  "guest_user_id"
  end

  add_index "payment_sources", ["billing_address_id"], name: "index_payment_sources_on_billing_address_id", using: :btree
  add_index "payment_sources", ["guest_user_id"], name: "index_payment_sources_on_guest_user_id", using: :btree
  add_index "payment_sources", ["payment_type_id"], name: "index_payment_sources_on_payment_type_id", using: :btree
  add_index "payment_sources", ["user_id"], name: "index_payment_sources_on_user_id", using: :btree
  add_index "payment_sources", ["uuid"], name: "index_payment_sources_on_uuid", unique: true, using: :btree

  create_table "payment_types", force: :cascade do |t|
    t.string   "name"
    t.string   "display_text"
    t.boolean  "offline",             default: false
    t.boolean  "enabled",             default: false
    t.boolean  "holdable",            default: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "plural_display_text"
  end

  create_table "phone_types", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pilot_currency_event_documents", force: :cascade do |t|
    t.string   "uuid"
    t.integer  "pilot_currency_event_id"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
    t.boolean  "active",                  default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "display_name"
  end

  add_index "pilot_currency_event_documents", ["pilot_currency_event_id"], name: "index_pilot_currency_event_documents_on_pilot_currency_event_id", using: :btree
  add_index "pilot_currency_event_documents", ["uuid"], name: "index_pilot_currency_event_documents_on_uuid", using: :btree

  create_table "pilot_currency_events", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "flight_personnel_id"
    t.date     "completed"
    t.date     "expires"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "base_month"
    t.integer  "operator_enabled_pilot_currency_type_id"
    t.string   "type_rating_designation"
    t.string   "uuid"
  end

  add_index "pilot_currency_events", ["flight_personnel_id"], name: "index_pilot_currency_events_on_flight_personnel_id", using: :btree
  add_index "pilot_currency_events", ["operator_id"], name: "index_pilot_currency_events_on_operator_id", using: :btree
  add_index "pilot_currency_events", ["uuid"], name: "index_pilot_currency_events_on_uuid", unique: true, using: :btree

  create_table "pilot_currency_types", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.integer  "default_duration"
    t.boolean  "default_expires_at_month_end"
    t.boolean  "default_per_aircraft_type"
    t.boolean  "active",                              default: true
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.integer  "index"
    t.boolean  "default_one_month_grace_period"
    t.string   "default_duration_units"
    t.integer  "default_age_range_year_low"
    t.integer  "default_age_range_year_high"
    t.boolean  "default_applies_to_pic",              default: true
    t.boolean  "default_applies_to_sic",              default: true
    t.boolean  "default_applies_to_sic_safety",       default: false
    t.boolean  "default_custom_expiration_per_check", default: false
  end

  add_index "pilot_currency_types", ["name"], name: "index_pilot_currency_types_on_name", using: :btree

  create_table "pilot_duty_day_annual_approvals", force: :cascade do |t|
    t.date     "for_year"
    t.integer  "for_pilot_id"
    t.datetime "approved_on"
    t.integer  "approved_by_id"
    t.string   "report_pdf_file_name"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "pilot_duty_day_annual_approvals", ["approved_by_id"], name: "index_pilot_duty_day_annual_approvals_on_approved_by_id", using: :btree
  add_index "pilot_duty_day_annual_approvals", ["for_pilot_id"], name: "index_pilot_duty_day_annual_approvals_on_for_pilot_id", using: :btree

  create_table "pilot_duty_day_monthly_approvals", force: :cascade do |t|
    t.date     "for_month"
    t.integer  "for_pilot_id"
    t.datetime "approved_on"
    t.integer  "approved_by_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "report_pdf_file_name"
  end

  add_index "pilot_duty_day_monthly_approvals", ["for_month"], name: "index_pilot_duty_day_monthly_approvals_on_for_month", using: :btree
  add_index "pilot_duty_day_monthly_approvals", ["for_pilot_id"], name: "index_pilot_duty_day_monthly_approvals_on_for_pilot_id", using: :btree

  create_table "pilot_duty_day_types", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "index"
  end

  create_table "pitcher_list_rankings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pricing_line_item_customer_groups", force: :cascade do |t|
    t.string   "name"
    t.integer  "operator_id"
    t.integer  "group_id"
    t.boolean  "global"
    t.integer  "index"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "show_zero_price", default: true
  end

  add_index "pricing_line_item_customer_groups", ["group_id"], name: "index_pricing_line_item_customer_groups_on_group_id", using: :btree
  add_index "pricing_line_item_customer_groups", ["operator_id"], name: "index_pricing_line_item_customer_groups_on_operator_id", using: :btree

  create_table "pricing_line_item_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.integer  "index"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "pricing_line_item_types", force: :cascade do |t|
    t.string   "name",                                      null: false
    t.string   "display_name",                              null: false
    t.boolean  "passthrough",               default: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "group_id"
    t.integer  "index"
    t.integer  "default_value",             default: 0
    t.boolean  "warnable"
    t.integer  "operator_id"
    t.integer  "default_quantity_waived",   default: 0
    t.integer  "default_quantity_minimum",  default: 0
    t.boolean  "included_by_default",       default: true
    t.boolean  "broker_only",               default: false
    t.boolean  "broker_exclude",            default: false
    t.boolean  "global"
    t.integer  "unit_id"
    t.integer  "minimum_unit_id"
    t.integer  "customer_group_id"
    t.boolean  "taxable",                   default: true
    t.boolean  "owner_exclude",             default: false
    t.boolean  "owner_include",             default: false
    t.integer  "default_cost_value",        default: 0
    t.boolean  "brokered_aircraft_include", default: false
    t.boolean  "brokered_aircraft_only",    default: false
    t.boolean  "is_tax",                    default: false
    t.boolean  "active",                    default: true
    t.boolean  "market_approved",           default: false
  end

  add_index "pricing_line_item_types", ["group_id"], name: "index_pricing_line_item_types_on_group_id", using: :btree

  create_table "pricing_line_item_units", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.string   "units"
    t.boolean  "quotable",     default: true
    t.boolean  "is_percent",   default: false
    t.boolean  "per_segment",  default: false
    t.integer  "precision",    default: 0
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "suggested_location_airports", force: :cascade do |t|
    t.integer  "suggested_location_id"
    t.integer  "airport_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "index"
  end

  add_index "suggested_location_airports", ["airport_id"], name: "index_suggested_location_airports_on_airport_id", using: :btree
  add_index "suggested_location_airports", ["suggested_location_id"], name: "index_suggested_location_airports_on_suggested_location_id", using: :btree

  create_table "suggested_locations", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "description"
    t.string   "small_image_url"
    t.string   "large_image_url"
    t.integer  "index"
    t.boolean  "needs_the"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "active",          default: true
  end

  create_table "suggested_trips", force: :cascade do |t|
    t.string   "slug"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.integer  "index"
    t.boolean  "popular"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "active",         default: true
  end

  add_index "suggested_trips", ["destination_id"], name: "index_suggested_trips_on_destination_id", using: :btree
  add_index "suggested_trips", ["origin_id"], name: "index_suggested_trips_on_origin_id", using: :btree

  create_table "temporary_flight_personnels", force: :cascade do |t|
    t.uuid     "uuid",                                             null: false
    t.integer  "operator_id"
    t.boolean  "gender_is_female"
    t.date     "date_of_birth"
    t.integer  "weight"
    t.string   "first_name",                                       null: false
    t.string   "middle_name"
    t.string   "last_name",                                        null: false
    t.boolean  "active",                            default: true
    t.string   "country_of_residence"
    t.string   "country_of_passport"
    t.string   "passport_number"
    t.date     "passport_expiration"
    t.string   "phone1"
    t.integer  "flight_personnel_role_id"
    t.string   "email"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.datetime "tfssp_manually_cleared_at"
    t.text     "tfssp_clearance_notes",             default: ""
    t.integer  "tfssp_manually_cleared_by_user_id"
    t.string   "birthplace_city"
    t.string   "birthplace_subregion"
    t.string   "birthplace_country"
    t.string   "address1"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "salutation"
    t.integer  "salutation_type",                   default: 0
  end

  add_index "temporary_flight_personnels", ["flight_personnel_role_id"], name: "index_temporary_flight_personnels_on_flight_personnel_role_id", using: :btree
  add_index "temporary_flight_personnels", ["operator_id"], name: "index_temporary_flight_personnels_on_operator_id", using: :btree
  add_index "temporary_flight_personnels", ["uuid"], name: "index_temporary_flight_personnels_on_uuid", using: :btree

  create_table "tfssp_fly_lists", force: :cascade do |t|
    t.string   "version"
    t.string   "kind"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tfssp_fly_lists", ["kind"], name: "index_tfssp_fly_lists_on_kind", using: :btree
  add_index "tfssp_fly_lists", ["version"], name: "index_tfssp_fly_lists_on_version", using: :btree

  create_table "tfssp_personnel_checks", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "trip_id"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "date_of_birth"
    t.boolean  "no_fly_failed"
    t.boolean  "selectee_failed"
    t.boolean  "cleared_failed"
    t.string   "no_fly_version"
    t.string   "selectee_version"
    t.string   "cleared_version"
    t.boolean  "crew_check",                  default: false
    t.boolean  "user_check",                  default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "no_fly_failed_without_dob"
    t.boolean  "selectee_failed_without_dob"
    t.datetime "manually_cleared_at"
    t.string   "manually_cleared_by"
    t.string   "fly_list_checkable_type"
    t.integer  "fly_list_checkable_id"
  end

  add_index "tfssp_personnel_checks", ["crew_check"], name: "index_tfssp_personnel_checks_on_crew_check", using: :btree
  add_index "tfssp_personnel_checks", ["operator_id"], name: "index_tfssp_personnel_checks_on_operator_id", using: :btree
  add_index "tfssp_personnel_checks", ["trip_id"], name: "index_tfssp_personnel_checks_on_trip_id", using: :btree
  add_index "tfssp_personnel_checks", ["user_check"], name: "index_tfssp_personnel_checks_on_user_check", using: :btree

  create_table "trip_documents", force: :cascade do |t|
    t.string   "uuid"
    t.integer  "trip_id"
    t.string   "display_name"
    t.integer  "operator_id"
    t.integer  "uploaded_by_id"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
    t.boolean  "active",           default: true
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "trip_documents", ["operator_id"], name: "index_trip_documents_on_operator_id", using: :btree
  add_index "trip_documents", ["trip_id"], name: "index_trip_documents_on_trip_id", using: :btree
  add_index "trip_documents", ["uuid"], name: "index_trip_documents_on_uuid", using: :btree

  create_table "trip_expense_documents", force: :cascade do |t|
    t.integer  "trip_expense_id"
    t.string   "uuid"
    t.string   "doc_file_name"
    t.string   "doc_content_type"
    t.integer  "doc_file_size"
    t.datetime "doc_updated_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "trip_expense_documents", ["trip_expense_id"], name: "index_trip_expense_documents_on_trip_expense_id", using: :btree
  add_index "trip_expense_documents", ["uuid"], name: "index_trip_expense_documents_on_uuid", using: :btree

  create_table "trip_expenses", force: :cascade do |t|
    t.integer  "operator_id"
    t.integer  "trip_id"
    t.integer  "aircraft_id"
    t.date     "expense_date"
    t.string   "vendor"
    t.decimal  "amount",                  precision: 9, scale: 2
    t.integer  "airport_id"
    t.integer  "expense_category"
    t.integer  "payment_method"
    t.integer  "reimbursable_to_user_id"
    t.integer  "bill_to"
    t.integer  "created_by_user_id"
    t.text     "notes"
    t.datetime "created_at",                                                      null: false
    t.datetime "updated_at",                                                      null: false
    t.string   "pnr"
    t.boolean  "amount_is_tbd",                                   default: false
  end

  add_index "trip_expenses", ["pnr"], name: "index_trip_expenses_on_pnr", unique: true, using: :btree
  add_index "trip_expenses", ["trip_id"], name: "index_trip_expenses_on_trip_id", using: :btree

  create_table "trip_payment_sources", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "payment_source_id"
    t.integer  "amount"
    t.boolean  "hold_only",         default: false, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "payment_type_id"
    t.boolean  "active",            default: true
  end

  add_index "trip_payment_sources", ["payment_source_id"], name: "index_trip_payment_sources_on_payment_source_id", using: :btree
  add_index "trip_payment_sources", ["payment_type_id"], name: "index_trip_payment_sources_on_payment_type_id", using: :btree
  add_index "trip_payment_sources", ["trip_id"], name: "index_trip_payment_sources_on_trip_id", using: :btree

  create_table "trip_quote_contracts", force: :cascade do |t|
    t.integer  "trip_quote_id"
    t.integer  "user_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "active",               default: true
    t.string   "signed_pdf_file_name"
    t.integer  "message_id"
    t.string   "signature_request_id"
    t.string   "status"
    t.boolean  "signed"
    t.integer  "guest_user_id"
  end

  add_index "trip_quote_contracts", ["guest_user_id"], name: "index_trip_quote_contracts_on_guest_user_id", using: :btree
  add_index "trip_quote_contracts", ["trip_quote_id"], name: "index_trip_quote_contracts_on_trip_quote_id", using: :btree
  add_index "trip_quote_contracts", ["user_id"], name: "index_trip_quote_contracts_on_user_id", using: :btree

  create_table "trip_quote_line_items", force: :cascade do |t|
    t.integer  "trip_quote_id"
    t.integer  "line_item_type_id"
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
    t.integer  "index"
    t.integer  "segment_id"
    t.boolean  "override_quantity"
    t.boolean  "should_warn",                                        default: false
    t.boolean  "round_up",                                           default: true
    t.decimal  "quantity",                  precision: 15, scale: 1
    t.decimal  "default_computed_quantity", precision: 15, scale: 1
    t.decimal  "unit_price"
    t.decimal  "unit_cost"
  end

  add_index "trip_quote_line_items", ["line_item_type_id"], name: "index_trip_quote_line_items_on_line_item_type_id", using: :btree
  add_index "trip_quote_line_items", ["segment_id"], name: "index_trip_quote_line_items_on_segment_id", using: :btree
  add_index "trip_quote_line_items", ["trip_quote_id"], name: "index_trip_quote_line_items_on_trip_quote_id", using: :btree

  create_table "trip_quote_segments", force: :cascade do |t|
    t.integer  "trip_quote_id"
    t.integer  "index"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.datetime "depart",                             null: false
    t.integer  "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "ground_speed"
    t.integer  "taxi_out_time"
    t.integer  "air_time"
    t.integer  "taxi_in_time"
    t.integer  "origin_fbo_id"
    t.integer  "destination_fbo_id"
    t.integer  "min_fuel_taken"
    t.text     "warning_notices"
    t.text     "warning_alerts"
    t.integer  "pax",                default: 0
    t.integer  "aircraft_id"
    t.boolean  "time_is_tbd",        default: false
    t.boolean  "pax_is_tbd",         default: false
  end

  add_index "trip_quote_segments", ["destination_fbo_id"], name: "index_trip_quote_segments_on_destination_fbo_id", using: :btree
  add_index "trip_quote_segments", ["destination_id"], name: "index_trip_quote_segments_on_destination_id", using: :btree
  add_index "trip_quote_segments", ["origin_fbo_id"], name: "index_trip_quote_segments_on_origin_fbo_id", using: :btree
  add_index "trip_quote_segments", ["origin_id"], name: "index_trip_quote_segments_on_origin_id", using: :btree
  add_index "trip_quote_segments", ["trip_quote_id"], name: "index_trip_quote_segments_on_trip_quote_id", using: :btree

  create_table "trip_quotes", force: :cascade do |t|
    t.integer  "aircraft_id"
    t.integer  "trip_id"
    t.integer  "total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "message_id"
    t.string   "quote_pnr"
    t.string   "quote_pdf_file_name"
    t.integer  "position_from_id"
    t.integer  "position_to_id"
    t.integer  "contact_info_id"
    t.integer  "pax"
    t.boolean  "double_rotation"
    t.integer  "double_rotation_price_diff"
    t.boolean  "oneway"
    t.text     "footer"
    t.boolean  "is_broker"
    t.string   "terms_pdf_file_name"
    t.string   "signable_quote_pdf_file_name"
    t.text     "terms_text"
    t.boolean  "SIC_requested",                     default: false
    t.boolean  "uses_brokered_aircraft",            default: false
    t.integer  "total_cost"
    t.boolean  "show_pos_segments_to_customer",     default: false
    t.integer  "finalized_by_user_id"
    t.integer  "kind",                              default: 0
    t.text     "footer_template"
    t.text     "terms_template"
    t.boolean  "show_tail_reg_to_customer",         default: false
    t.boolean  "show_only_total_price_to_customer", default: false
  end

  add_index "trip_quotes", ["aircraft_id"], name: "index_trip_quotes_on_aircraft_id", using: :btree
  add_index "trip_quotes", ["message_id"], name: "index_trip_quotes_on_message_id", unique: true, using: :btree
  add_index "trip_quotes", ["position_from_id"], name: "index_trip_quotes_on_position_from_id", using: :btree
  add_index "trip_quotes", ["position_to_id"], name: "index_trip_quotes_on_position_to_id", using: :btree
  add_index "trip_quotes", ["quote_pnr"], name: "index_trip_quotes_on_quote_pnr", unique: true, using: :btree
  add_index "trip_quotes", ["trip_id"], name: "index_trip_quotes_on_trip_id", using: :btree

  create_table "trip_rating_systems", force: :cascade do |t|
    t.string  "tagline"
    t.text    "review"
    t.integer "overall_rating"
    t.integer "trip_id"
    t.integer "user_id"
    t.boolean "featured"
    t.string  "uuid"
    t.integer "crew_rating"
    t.integer "aircraft_rating"
  end

  create_table "trip_request_segments", force: :cascade do |t|
    t.integer  "trip_request_id"
    t.integer  "origin_id"
    t.integer  "destination_id"
    t.datetime "depart_or_arrive_datetime"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "datetime_is_depart_else_arrive", default: true
    t.boolean  "time_is_tbd",                    default: false
  end

  add_index "trip_request_segments", ["trip_request_id"], name: "index_trip_request_segments_on_trip_request_id", using: :btree

  create_table "trip_requests", force: :cascade do |t|
    t.integer  "pax"
    t.integer  "operator_id"
    t.integer  "aircraft_id"
    t.string   "source"
    t.integer  "contact_info_id"
    t.datetime "created_at",                                                        null: false
    t.datetime "updated_at",                                                        null: false
    t.inet     "ip"
    t.string   "session"
    t.string   "current_step"
    t.integer  "user_id"
    t.integer  "aircraft_category_id"
    t.integer  "aircraft_type_id"
    t.boolean  "SIC_requested",                                     default: false
    t.boolean  "for_owner",                                         default: false
    t.string   "source_external_id"
    t.text     "source_notes"
    t.datetime "source_request_created_at"
    t.decimal  "source_estimated_total",    precision: 8, scale: 2
    t.string   "source_type"
    t.text     "source_acceptance_url"
    t.string   "source_response"
    t.datetime "source_response_datetime"
    t.integer  "created_by_user_id"
    t.integer  "trip_type",                                         default: 0
    t.boolean  "empty_leg",                                         default: false
    t.text     "source_metadata"
    t.boolean  "pax_is_tbd",                                        default: false
  end

  add_index "trip_requests", ["aircraft_id"], name: "index_trip_requests_on_aircraft_id", using: :btree
  add_index "trip_requests", ["contact_info_id"], name: "index_trip_requests_on_contact_info_id", using: :btree
  add_index "trip_requests", ["operator_id"], name: "index_trip_requests_on_operator_id", using: :btree
  add_index "trip_requests", ["source_external_id"], name: "index_trip_requests_on_source_external_id", using: :btree
  add_index "trip_requests", ["source_type"], name: "index_trip_requests_on_source_type", using: :btree

  create_table "trip_service_issue_types", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.integer  "index"
    t.boolean  "active",       default: true
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "trip_special_item_types", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "index"
  end

  create_table "trip_special_items", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "trip_special_item_type_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "trip_special_items", ["trip_id"], name: "index_trip_special_items_on_trip_id", using: :btree

  create_table "trip_statuses", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "display_text",             limit: 255
    t.boolean  "trip_on_schedule",                     default: false
    t.boolean  "trip_on_schedule_as_hold",             default: false
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                                                          default: true
    t.integer  "operator_id"
    t.integer  "booked_aircraft_id"
    t.string   "pnr",                                                 limit: 255
    t.integer  "current_quote_id"
    t.boolean  "operator_ignore",                                                 default: false
    t.boolean  "customer_ignore",                                                 default: false
    t.integer  "customer_id"
    t.text     "operator_comments"
    t.string   "view_token"
    t.integer  "request_id"
    t.integer  "booking_confirmed_message_id"
    t.boolean  "marked_as_booked_manually"
    t.integer  "booking_number"
    t.text     "special_item_notes"
    t.text     "special_request_notes"
    t.text     "operator_notes_for_passengers"
    t.text     "operator_notes_for_crew"
    t.boolean  "notes_complete"
    t.boolean  "services_complete"
    t.integer  "last_unsent_quote_id"
    t.boolean  "actuals_complete"
    t.integer  "quote_for_changed_itinerary_id"
    t.integer  "quote_for_changed_itinerary_temp_while_editing_id"
    t.integer  "cached_origin_id"
    t.integer  "cached_destination_id"
    t.integer  "cached_aircraft_id"
    t.datetime "cached_depart_datetime"
    t.boolean  "passengers_complete"
    t.boolean  "flight_personnel_complete"
    t.integer  "quote_for_post_flight_invoice_id"
    t.integer  "planner_id"
    t.boolean  "bill_to_company",                                                 default: false
    t.boolean  "invoice_complete",                                                default: false
    t.integer  "trip_released_by_id"
    t.datetime "trip_released_on"
    t.text     "operator_crew_text_for_brokered_aircraft"
    t.text     "trip_released_notes"
    t.integer  "expense_unique_counter",                                          default: 1
    t.boolean  "docs_complete",                                                   default: false
    t.boolean  "expenses_complete"
    t.string   "shareable_view_token"
    t.integer  "trip_type",                                                       default: 0
    t.integer  "quote_for_post_flight_invoice_temp_while_editing_id"
    t.datetime "invoice_synchronized_with_quickbooks_at"
    t.boolean  "crew_passed_tfssp_check"
    t.boolean  "passengers_passed_tfssp_check"
    t.text     "autocomplete_search_field"
    t.boolean  "admin_payment_ignore",                                            default: false
  end

  add_index "trips", ["admin_payment_ignore"], name: "index_trips_on_admin_payment_ignore", using: :btree
  add_index "trips", ["autocomplete_search_field"], name: "index_trips_on_autocomplete_search_field", using: :gin
  add_index "trips", ["booked_aircraft_id"], name: "index_trips_on_booked_aircraft_id", using: :btree
  add_index "trips", ["booking_number"], name: "index_trips_on_booking_number", using: :btree
  add_index "trips", ["current_quote_id"], name: "index_trips_on_current_quote_id", unique: true, using: :btree
  add_index "trips", ["customer_id"], name: "index_trips_on_customer_id", using: :btree
  add_index "trips", ["operator_id"], name: "index_trips_on_operator_id", using: :btree
  add_index "trips", ["pnr"], name: "index_trips_on_pnr", unique: true, using: :btree
  add_index "trips", ["request_id"], name: "index_trips_on_request_id", using: :btree
  add_index "trips", ["status_id"], name: "index_trips_on_status_id", using: :btree

  create_table "user_aircraft_whitelists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "aircraft_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "user_aircraft_whitelists", ["aircraft_id"], name: "index_user_aircraft_whitelists_on_aircraft_id", using: :btree
  add_index "user_aircraft_whitelists", ["user_id"], name: "index_user_aircraft_whitelists_on_user_id", using: :btree

  create_table "user_signatures", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "svg_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_signatures", ["user_id"], name: "index_user_signatures_on_user_id", using: :btree

  create_table "user_timezones", force: :cascade do |t|
    t.string   "name"
    t.string   "display_name"
    t.string   "display_name_short"
    t.string   "ruby_timezone"
    t.integer  "index"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                 limit: 255, default: "",    null: false
    t.string   "encrypted_password",                    limit: 255, default: "",    null: false
    t.string   "reset_password_token",                  limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token",                    limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email",                     limit: 255
    t.integer  "operator_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.integer  "contact_info_id"
    t.boolean  "is_broker",                                         default: false
    t.integer  "failed_attempts",                                   default: 0
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "payment_processor_customer_token"
    t.integer  "default_payment_source_id"
    t.string   "uuid"
    t.string   "google_oauth_access_token"
    t.string   "google_oauth_refresh_token"
    t.datetime "google_oauth_token_expires_at"
    t.datetime "last_google_calendar_sync_started_at"
    t.datetime "last_google_calendar_sync_finished_at"
    t.integer  "user_timezone_id"
    t.integer  "roles_mask",                                        default: 0
    t.boolean  "active",                                            default: true
    t.text     "extra_info"
    t.boolean  "sign_in_disabled",                                  default: false
    t.string   "gauth_secret"
    t.string   "gauth_enabled",                                     default: "0"
    t.string   "gauth_tmp"
    t.datetime "gauth_tmp_datetime"
    t.integer  "qotd_type",                                         default: 1
    t.string   "encrypted_pin"
    t.datetime "tfssp_manually_cleared_at"
    t.text     "tfssp_clearance_notes",                             default: ""
    t.integer  "tfssp_manually_cleared_by_user_id"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", using: :btree
  add_index "users", ["contact_info_id"], name: "index_users_on_contact_info_id", unique: true, using: :btree
  add_index "users", ["default_payment_source_id"], name: "index_users_on_default_payment_source_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", using: :btree
  add_index "users", ["uuid"], name: "index_users_on_uuid", unique: true, using: :btree

  create_table "wind_forecasts", force: :cascade do |t|
    t.integer  "month"
    t.decimal  "latitude"
    t.decimal  "longitude"
    t.integer  "pressure"
    t.float    "uwnd"
    t.float    "vwnd"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "wind_forecasts", ["longitude", "latitude", "pressure", "month"], name: "index_wind_forecasts_on_lon_lat_pressure_month", unique: true, using: :btree

  add_foreign_key "aircraft_call_sign_aliases", "aircrafts"
  add_foreign_key "aircraft_currency_event_documents", "aircraft_currency_events"
  add_foreign_key "aircraft_currency_events", "aircrafts"
  add_foreign_key "aircraft_currency_events", "operator_enabled_aircraft_currency_types"
  add_foreign_key "aircraft_currency_events", "operators"
  add_foreign_key "aircraft_documents", "aircraft_document_types"
  add_foreign_key "aircraft_documents", "aircrafts"
  add_foreign_key "aircraft_event_flight_personnel_roles", "aircrafts"
  add_foreign_key "aircraft_event_flight_personnel_roles", "event_flight_personnel_roles"
  add_foreign_key "aircraft_flight_logs", "aircrafts"
  add_foreign_key "aircraft_flight_logs", "e_signatures", column: "log_complete_pilot_e_signature_id"
  add_foreign_key "aircraft_flight_logs", "e_signatures", column: "pre_flight_sign_off_e_signature_id"
  add_foreign_key "aircraft_flight_logs", "operators"
  add_foreign_key "aircraft_flight_logs", "users", column: "maintenance_approved_by_id"
  add_foreign_key "aircraft_flight_logs", "users", column: "marked_complete_by_id"
  add_foreign_key "aircraft_service_issues", "aircrafts"
  add_foreign_key "aircraft_service_issues", "operators"
  add_foreign_key "aircraft_service_issues", "trip_service_issue_types"
  add_foreign_key "aircraft_service_issues", "trips"
  add_foreign_key "aircraft_service_issues", "users", column: "logged_by_id"
  add_foreign_key "aircraft_service_issues", "users", column: "marked_resolved_by_id"
  add_foreign_key "aircraft_type_default_values", "aircraft_types"
  add_foreign_key "aircraft_type_families", "aircraft_types", column: "canonical_aircraft_type_id"
  add_foreign_key "aircraft_type_groups", "aircraft_type_families", column: "canonical_aircraft_type_family_id"
  add_foreign_key "aircraft_types", "aircraft_type_families"
  add_foreign_key "aircrafts", "airport_fbos", column: "home_base_fbo_id"
  add_foreign_key "aircrafts", "airports", column: "current_airport_override_id"
  add_foreign_key "aircrafts", "event_colors"
  add_foreign_key "airport_caterers", "airports"
  add_foreign_key "airport_comments", "airports"
  add_foreign_key "airport_comments", "operators"
  add_foreign_key "airport_fbo_fuel_prices", "airport_fbos"
  add_foreign_key "airport_fbo_fuel_prices", "operators"
  add_foreign_key "airport_fbos", "operators"
  add_foreign_key "airport_fet_precalculated_percentages", "airports", column: "from_airport_id"
  add_foreign_key "airport_fet_precalculated_percentages", "airports", column: "to_airport_id"
  add_foreign_key "airport_instrument_procedures", "airport_instrument_procedure_types", column: "procedure_type_id"
  add_foreign_key "airport_instrument_procedures", "airports"
  add_foreign_key "airport_nearby", "airports"
  add_foreign_key "airport_nearby", "airports", column: "nearby_airport_id"
  add_foreign_key "airport_operator_preferences", "airport_fbos"
  add_foreign_key "airport_operator_preferences", "airports"
  add_foreign_key "airport_operator_preferences", "operators"
  add_foreign_key "airports", "airports", column: "closest_part_139_airport_id"
  add_foreign_key "airworthiness_releases", "aircrafts"
  add_foreign_key "airworthiness_releases", "e_signatures", column: "sign_off_e_signature_id"
  add_foreign_key "airworthiness_releases", "users", column: "logged_by_user_id"
  add_foreign_key "companies", "operators"
  add_foreign_key "cost_pricing_line_items", "airport_fbos"
  add_foreign_key "cost_pricing_line_items", "airports"
  add_foreign_key "cost_pricing_line_items", "operators"
  add_foreign_key "cost_pricing_line_items", "pricing_line_item_types", column: "line_item_type_id"
  add_foreign_key "customer_delegates", "customers", column: "grantor_id"
  add_foreign_key "customer_delegates", "customers", column: "recipient_id"
  add_foreign_key "customer_passengers", "customers"
  add_foreign_key "customer_passengers", "passengers"
  add_foreign_key "customers", "companies"
  add_foreign_key "discrepancies", "aircrafts"
  add_foreign_key "discrepancies", "users", column: "found_by_user_id"
  add_foreign_key "discrepancies", "users", column: "logged_by_user_id"
  add_foreign_key "e_signatures", "operators"
  add_foreign_key "e_signatures", "users"
  add_foreign_key "eapis_flight_segments", "airports", column: "arrival_airport_id"
  add_foreign_key "eapis_flight_segments", "airports", column: "departure_airport_id"
  add_foreign_key "eapis_flight_segments", "eapis_messages"
  add_foreign_key "eapis_messages", "events"
  add_foreign_key "eapis_messages", "trips"
  add_foreign_key "eapis_passengers", "eapis_messages"
  add_foreign_key "eapis_passengers", "event_flight_personnels"
  add_foreign_key "eapis_passengers", "passengers"
  add_foreign_key "event_feed_aircrafts", "aircrafts"
  add_foreign_key "event_feed_aircrafts", "event_feeds"
  add_foreign_key "event_feed_personnels", "event_feeds"
  add_foreign_key "event_feed_personnels", "flight_personnels"
  add_foreign_key "event_feeds", "operators"
  add_foreign_key "event_feeds", "users"
  add_foreign_key "event_flight_personnel_role_qualifications", "aircrafts"
  add_foreign_key "event_flight_personnel_role_qualifications", "event_flight_personnel_roles"
  add_foreign_key "event_flight_personnel_role_qualifications", "flight_personnels"
  add_foreign_key "event_flight_personnel_roles", "flight_personnel_roles"
  add_foreign_key "event_flight_personnels", "event_flight_personnel_roles"
  add_foreign_key "event_flight_personnels", "events"
  add_foreign_key "event_flight_personnels", "flight_personnels"
  add_foreign_key "event_flight_personnels", "temporary_flight_personnels"
  add_foreign_key "event_passengers", "events"
  add_foreign_key "event_passengers", "passengers"
  add_foreign_key "event_services", "contact_infos", column: "provider_contact_info_id"
  add_foreign_key "event_services", "events"
  add_foreign_key "events", "aircraft_flight_logs"
  add_foreign_key "events", "aircrafts"
  add_foreign_key "events", "airport_fbos", column: "destination_fbo_id"
  add_foreign_key "events", "airport_fbos", column: "origin_fbo_id"
  add_foreign_key "events", "airports", column: "destination_id"
  add_foreign_key "events", "airports", column: "origin_id"
  add_foreign_key "events", "event_types"
  add_foreign_key "events", "operators"
  add_foreign_key "events", "trip_quote_segments"
  add_foreign_key "events", "trips"
  add_foreign_key "financial_transactions", "customers"
  add_foreign_key "financial_transactions", "financial_transactions", column: "capture_for_id"
  add_foreign_key "financial_transactions", "financial_transactions", column: "refund_for_id"
  add_foreign_key "financial_transactions", "payment_sources"
  add_foreign_key "financial_transactions", "trips"
  add_foreign_key "financial_transactions", "users", column: "created_by_user_id"
  add_foreign_key "flight_actual_personnel_approaches", "flight_actual_personnels"
  add_foreign_key "flight_actual_personnels", "event_flight_personnel_roles"
  add_foreign_key "flight_actual_personnels", "flight_actuals"
  add_foreign_key "flight_actual_personnels", "flight_personnels"
  add_foreign_key "flight_actual_personnels", "temporary_flight_personnels"
  add_foreign_key "flight_actuals", "aircraft_flight_logs"
  add_foreign_key "flight_actuals", "aircrafts"
  add_foreign_key "flight_actuals", "airports", column: "destination_id"
  add_foreign_key "flight_actuals", "airports", column: "origin_id"
  add_foreign_key "flight_actuals", "e_signatures", column: "vor_check_e_signature_id"
  add_foreign_key "flight_actuals", "operators"
  add_foreign_key "flight_actuals", "trip_service_issue_types"
  add_foreign_key "flight_actuals", "trips"
  add_foreign_key "flight_actuals", "users", column: "marked_complete_by_id"
  add_foreign_key "flight_actuals", "users", column: "service_issue_acknowledged_by_id"
  add_foreign_key "flight_personnel_document_types", "flight_personnel_roles"
  add_foreign_key "flight_personnel_documents", "flight_personnel_document_types"
  add_foreign_key "flight_personnel_documents", "flight_personnels"
  add_foreign_key "flight_personnel_duty_days", "flight_personnels"
  add_foreign_key "flight_personnel_duty_days", "operators"
  add_foreign_key "flight_personnel_duty_days", "pilot_duty_day_types"
  add_foreign_key "flight_personnel_duty_days", "trips"
  add_foreign_key "flight_personnels", "airports", column: "home_base_id"
  add_foreign_key "flight_personnels", "event_colors"
  add_foreign_key "flight_personnels", "flight_personnel_roles"
  add_foreign_key "flight_personnels", "operators"
  add_foreign_key "flight_personnels", "users"
  add_foreign_key "fly_list_import_statuses", "operators"
  add_foreign_key "maintenance_sign_offs", "discrepancies"
  add_foreign_key "maintenance_sign_offs", "e_signatures", column: "sign_off_e_signature_id"
  add_foreign_key "maintenance_sign_offs", "users", column: "marked_approved_by_id"
  add_foreign_key "maintenance_sign_offs", "users", column: "signed_by_user_id"
  add_foreign_key "message_templates", "message_template_types"
  add_foreign_key "minimum_equipment_lists", "discrepancies"
  add_foreign_key "minimum_equipment_lists", "e_signatures", column: "sign_off_e_signature_id"
  add_foreign_key "minimum_equipment_lists", "users"
  add_foreign_key "minimum_equipment_lists", "users", column: "marked_approved_by_id"
  add_foreign_key "notifyees", "customers"
  add_foreign_key "notifyees", "users"
  add_foreign_key "operator_document_options", "operators"
  add_foreign_key "operator_documents", "operator_document_types"
  add_foreign_key "operator_documents", "operators"
  add_foreign_key "operator_enabled_aircraft_currency_types", "aircraft_currency_types"
  add_foreign_key "operator_enabled_aircraft_currency_types", "operators"
  add_foreign_key "operator_enabled_pilot_currency_types", "operators"
  add_foreign_key "operator_enabled_pilot_currency_types", "pilot_currency_types"
  add_foreign_key "operator_expense_mappings", "operators"
  add_foreign_key "operator_expense_mappings", "pricing_line_item_types", column: "pricing_line_item_type_for_brokered_id"
  add_foreign_key "operator_expense_mappings", "pricing_line_item_types", column: "pricing_line_item_type_for_non_brokered_id"
  add_foreign_key "operator_payment_types", "customers"
  add_foreign_key "operator_payment_types", "operators"
  add_foreign_key "operator_payment_types", "payment_types"
  add_foreign_key "passengers", "users"
  add_foreign_key "payment_sources", "contact_infos", column: "billing_address_id"
  add_foreign_key "payment_sources", "guest_users"
  add_foreign_key "payment_sources", "payment_types"
  add_foreign_key "payment_sources", "users"
  add_foreign_key "pilot_currency_event_documents", "pilot_currency_events"
  add_foreign_key "pilot_currency_events", "flight_personnels"
  add_foreign_key "pilot_currency_events", "operator_enabled_pilot_currency_types"
  add_foreign_key "pilot_currency_events", "operators"
  add_foreign_key "pilot_duty_day_annual_approvals", "flight_personnels", column: "for_pilot_id"
  add_foreign_key "pilot_duty_day_annual_approvals", "users", column: "approved_by_id"
  add_foreign_key "pilot_duty_day_monthly_approvals", "flight_personnels", column: "for_pilot_id"
  add_foreign_key "pilot_duty_day_monthly_approvals", "users", column: "approved_by_id"
  add_foreign_key "pricing_line_item_customer_groups", "operators"
  add_foreign_key "pricing_line_item_customer_groups", "pricing_line_item_groups", column: "group_id"
  add_foreign_key "pricing_line_item_types", "operators"
  add_foreign_key "pricing_line_item_types", "pricing_line_item_customer_groups", column: "customer_group_id"
  add_foreign_key "pricing_line_item_types", "pricing_line_item_units", column: "minimum_unit_id"
  add_foreign_key "pricing_line_item_types", "pricing_line_item_units", column: "unit_id"
  add_foreign_key "suggested_location_airports", "airports"
  add_foreign_key "suggested_location_airports", "suggested_locations"
  add_foreign_key "suggested_trips", "suggested_locations", column: "destination_id"
  add_foreign_key "suggested_trips", "suggested_locations", column: "origin_id"
  add_foreign_key "temporary_flight_personnels", "flight_personnel_roles"
  add_foreign_key "temporary_flight_personnels", "operators"
  add_foreign_key "tfssp_personnel_checks", "operators"
  add_foreign_key "tfssp_personnel_checks", "trips"
  add_foreign_key "trip_documents", "operators"
  add_foreign_key "trip_documents", "trips"
  add_foreign_key "trip_documents", "users", column: "uploaded_by_id"
  add_foreign_key "trip_expense_documents", "trip_expenses"
  add_foreign_key "trip_expenses", "aircrafts"
  add_foreign_key "trip_expenses", "airports"
  add_foreign_key "trip_expenses", "operators"
  add_foreign_key "trip_expenses", "trips"
  add_foreign_key "trip_expenses", "users", column: "created_by_user_id"
  add_foreign_key "trip_expenses", "users", column: "reimbursable_to_user_id"
  add_foreign_key "trip_payment_sources", "payment_sources"
  add_foreign_key "trip_payment_sources", "payment_types"
  add_foreign_key "trip_payment_sources", "trips"
  add_foreign_key "trip_quote_contracts", "messages"
  add_foreign_key "trip_quote_segments", "aircrafts"
  add_foreign_key "trip_quotes", "users", column: "finalized_by_user_id"
  add_foreign_key "trip_rating_systems", "trips"
  add_foreign_key "trip_rating_systems", "users"
  add_foreign_key "trip_request_segments", "airports", column: "destination_id"
  add_foreign_key "trip_request_segments", "airports", column: "origin_id"
  add_foreign_key "trip_request_segments", "trip_requests"
  add_foreign_key "trip_requests", "aircraft_categories"
  add_foreign_key "trip_requests", "aircraft_types"
  add_foreign_key "trip_requests", "users"
  add_foreign_key "trip_requests", "users", column: "created_by_user_id"
  add_foreign_key "trip_special_items", "trips"
  add_foreign_key "trips", "aircrafts", column: "cached_aircraft_id"
  add_foreign_key "trips", "airports", column: "cached_destination_id"
  add_foreign_key "trips", "airports", column: "cached_origin_id"
  add_foreign_key "trips", "customers", column: "planner_id"
  add_foreign_key "trips", "messages", column: "booking_confirmed_message_id"
  add_foreign_key "trips", "trip_quotes", column: "quote_for_changed_itinerary_id"
  add_foreign_key "trips", "trip_quotes", column: "quote_for_changed_itinerary_temp_while_editing_id"
  add_foreign_key "trips", "trip_quotes", column: "quote_for_post_flight_invoice_id"
  add_foreign_key "trips", "trip_quotes", column: "quote_for_post_flight_invoice_temp_while_editing_id"
  add_foreign_key "trips", "users", column: "trip_released_by_id"
  add_foreign_key "user_aircraft_whitelists", "aircrafts"
  add_foreign_key "user_aircraft_whitelists", "users"
  add_foreign_key "user_signatures", "users"
  add_foreign_key "users", "payment_sources", column: "default_payment_source_id"
  add_foreign_key "users", "user_timezones"
end
