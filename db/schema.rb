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

ActiveRecord::Schema[7.1].define(version: 2025_04_03_181424) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "delayed_jobs", id: :serial, force: :cascade do |t|
    t.integer "priority", default: 0
    t.integer "attempts", default: 0
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at", precision: nil
    t.datetime "locked_at", precision: nil
    t.datetime "failed_at", precision: nil
    t.string "locked_by", limit: 255
    t.string "queue", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "demand_data", id: :serial, force: :cascade do |t|
    t.integer "school_id"
    t.string "bps_id", limit: 255
    t.string "year", limit: 255
    t.string "grade_level", limit: 255
    t.integer "seats_before_round"
    t.integer "seats_after_round"
    t.integer "total_seats"
    t.integer "first_choice_applicants"
    t.integer "second_choice_applicants"
    t.integer "third_choice_applicants"
    t.integer "total_applicants"
    t.decimal "applicants_per_open_seat"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["grade_level"], name: "index_demand_data_on_grade_level"
    t.index ["school_id"], name: "index_demand_data_on_school_id"
    t.index ["year"], name: "index_demand_data_on_year"
  end

  create_table "notifications", id: :serial, force: :cascade do |t|
    t.text "message"
    t.datetime "start_time", precision: nil
    t.datetime "end_time", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.boolean "home_page", default: true
    t.boolean "schools_page", default: true
    t.boolean "school_choice_pages", default: false
  end

  create_table "preference_categories", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "sort_order"
    t.boolean "qualitative_criteria", default: true
    t.boolean "include_in_special_needs_dialog_box", default: false
    t.text "description"
    t.string "select_type", limit: 255, default: "check_mark"
    t.string "glyph_id", limit: 255
    t.string "glyph_class", limit: 255
    t.boolean "include_in_preferences_panel", default: true
  end

  create_table "preferences", id: :serial, force: :cascade do |t|
    t.integer "preference_category_id"
    t.string "name", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.integer "sort_order"
    t.boolean "grade_k0", default: false
    t.boolean "grade_k1", default: false
    t.boolean "grade_k2", default: false
    t.boolean "grade_1", default: false
    t.boolean "grade_2", default: false
    t.boolean "grade_3", default: false
    t.boolean "grade_4", default: false
    t.boolean "grade_5", default: false
    t.boolean "grade_6", default: false
    t.boolean "grade_7", default: false
    t.boolean "grade_8", default: false
    t.boolean "grade_9", default: false
    t.boolean "grade_10", default: false
    t.boolean "grade_11", default: false
    t.boolean "grade_12", default: false
    t.string "api_table_name", limit: 255
    t.string "api_table_key", limit: 255
    t.string "api_table_value", limit: 255
    t.index ["preference_category_id"], name: "index_preferences_on_preference_category_id"
  end

  create_table "preferences_students", id: false, force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "preference_id", null: false
    t.index ["preference_id"], name: "index_preferences_students_on_preference_id"
    t.index ["student_id"], name: "index_preferences_students_on_student_id"
  end

  create_table "registration_dates", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "start_date", precision: nil
    t.datetime "end_date", precision: nil
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "schools", id: :serial, force: :cascade do |t|
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.text "api_basic_info"
    t.text "api_awards"
    t.text "api_description"
    t.text "api_facilities"
    t.text "api_grades"
    t.text "api_hours"
    t.text "api_languages"
    t.text "api_partners"
    t.text "api_photos"
    t.string "name", limit: 255
    t.string "bps_id", limit: 255
    t.string "slug", limit: 255
    t.float "latitude"
    t.float "longitude"
    t.text "api_sports"
    t.text "api_student_support"
    t.text "api_preview_dates"
    t.text "api_programs"
    t.text "api_surround_care"
    t.datetime "last_sync", precision: nil
    t.datetime "last_sync_basic_info", precision: nil
    t.datetime "last_sync_awards", precision: nil
    t.datetime "last_sync_descriptions", precision: nil
    t.datetime "last_sync_facilities", precision: nil
    t.datetime "last_sync_grades", precision: nil
    t.datetime "last_sync_hours", precision: nil
    t.datetime "last_sync_languages", precision: nil
    t.datetime "last_sync_partners", precision: nil
    t.datetime "last_sync_photos", precision: nil
    t.datetime "last_sync_preview_dates", precision: nil
    t.datetime "last_sync_programs", precision: nil
    t.datetime "last_sync_sports", precision: nil
    t.datetime "last_sync_student_support", precision: nil
    t.datetime "last_sync_surround_care", precision: nil
    t.index ["slug"], name: "index_schools_on_slug", unique: true
  end

  create_table "searches", id: :serial, force: :cascade do |t|
    t.string "street_number", limit: 255
    t.string "street_name", limit: 255
    t.string "zipcode", limit: 255
    t.string "iep", limit: 255
    t.string "primary_language", limit: 255
    t.text "session_key"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "sibling_school_name", limit: 255
    t.integer "sibling_school_id"
    t.string "student_1_first_name", limit: 255
    t.string "student_1_last_name", limit: 255
    t.string "student_1_grade_level", limit: 255
    t.string "student_2_first_name", limit: 255
    t.string "student_2_last_name", limit: 255
    t.string "student_2_grade_level", limit: 255
    t.string "student_3_first_name", limit: 255
    t.string "student_3_last_name", limit: 255
    t.string "student_3_grade_level", limit: 255
    t.string "student_4_first_name", limit: 255
    t.string "student_4_last_name", limit: 255
    t.string "student_4_grade_level", limit: 255
    t.string "student_5_first_name", limit: 255
    t.string "student_5_last_name", limit: 255
    t.string "student_5_grade_level", limit: 255
  end

  create_table "stored_searches", id: :serial, force: :cascade do |t|
    t.text "json"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
  end

  create_table "student_schools", id: :serial, force: :cascade do |t|
    t.integer "student_id"
    t.integer "school_id"
    t.string "tier", limit: 255
    t.string "walk_zone_eligibility", limit: 255
    t.string "transportation_eligibility", limit: 255
    t.string "distance", limit: 255
    t.string "walk_time", limit: 255
    t.string "drive_time", limit: 255
    t.integer "sort_order"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "bps_id", limit: 255
    t.boolean "ranked", default: false
    t.boolean "exam_school", default: false
    t.text "eligibility"
    t.string "school_type", limit: 255
    t.boolean "starred", default: false
    t.string "sped_cluster", limit: 255
    t.text "sped_description"
    t.string "ell_cluster", limit: 255
    t.text "ell_description"
    t.string "call_id", limit: 255
    t.string "program_code", limit: 255
    t.integer "choice_rank"
    t.string "school_name", limit: 255
    t.text "program_code_description"
    t.string "special_admissions", limit: 255
    t.string "walk_distance", limit: 255
    t.string "dese_tier", limit: 255
    t.string "tier_explanation", limit: 255
    t.string "school_dese_accountability", limit: 255
    t.index ["bps_id"], name: "index_student_schools_on_bps_id"
    t.index ["school_id"], name: "index_student_schools_on_school_id"
    t.index ["school_type"], name: "index_student_schools_on_school_type"
    t.index ["student_id"], name: "index_student_schools_on_student_id"
  end

  create_table "students", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.string "session_id", limit: 255
    t.string "first_name", limit: 255
    t.string "last_name", limit: 255
    t.string "grade_level", limit: 255
    t.string "street_number", limit: 255
    t.string "street_name", limit: 255
    t.string "zipcode", limit: 255
    t.string "primary_language", limit: 255
    t.text "sibling_school_names"
    t.text "sibling_school_ids"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.float "latitude"
    t.float "longitude"
    t.string "neighborhood", limit: 255
    t.boolean "sped_needs", default: false
    t.string "ell_language", limit: 255
    t.time "schools_last_updated_at"
    t.float "x_coordinate"
    t.float "y_coordinate"
    t.datetime "deleted_at", precision: nil
    t.boolean "address_verified", default: false
    t.string "geo_code", limit: 255
    t.integer "preferences_count", default: 0
    t.boolean "awc_invitation", default: false
    t.string "addressid", limit: 255
    t.text "home_schools_json"
    t.text "ell_schools_json"
    t.text "sped_schools_json"
    t.integer "step", default: 1
    t.integer "old_user_id"
    t.string "old_session_id", limit: 255
    t.string "ell_cluster", limit: 255
    t.string "sped_cluster", limit: 255
    t.string "zone", limit: 255
    t.text "token"
    t.text "session_token"
    t.string "student_id", limit: 255
    t.string "address_id", limit: 255
    t.boolean "ranked", default: false
    t.datetime "ranked_at", precision: nil
    t.string "parent_name", limit: 255
    t.text "choice_schools_json"
    t.string "student_caseid", limit: 255
    t.index ["session_id"], name: "index_students_on_session_id"
    t.index ["session_token"], name: "index_students_on_session_token"
    t.index ["token"], name: "index_students_on_token"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "text_snippets", id: :serial, force: :cascade do |t|
    t.string "location", limit: 255
    t.text "text"
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "slug", limit: 255
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: ""
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at", precision: nil
    t.datetime "remember_created_at", precision: nil
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at", precision: nil
    t.datetime "last_sign_in_at", precision: nil
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.string "provider", limit: 255
    t.string "uid", limit: 255
    t.string "name", limit: 255
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
