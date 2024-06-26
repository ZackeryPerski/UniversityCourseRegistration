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

ActiveRecord::Schema[7.1].define(version: 2024_03_28_014423) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "department_id", null: false
    t.string "code"
    t.integer "credits"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_courses_on_department_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "department_head_id"
    t.index ["department_head_id"], name: "index_departments_on_department_head_id"
  end

  create_table "instructors", force: :cascade do |t|
    t.string "ssn"
    t.string "phone_number"
    t.bigint "department_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_instructors_on_department_id"
    t.index ["user_id"], name: "index_instructors_on_user_id"
  end

  create_table "prerequisites", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "prerequisite_course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_prerequisites_on_course_id"
    t.index ["prerequisite_course_id"], name: "index_prerequisites_on_prerequisite_course_id"
  end

  create_table "sections", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "instructor_id", null: false
    t.integer "capacity"
    t.string "semester"
    t.integer "year"
    t.string "days"
    t.time "start_time"
    t.time "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_sections_on_course_id"
    t.index ["instructor_id"], name: "index_sections_on_instructor_id"
  end

  create_table "sections_students", force: :cascade do |t|
    t.bigint "section_id", null: false
    t.bigint "student_id", null: false
    t.string "grade"
    t.index ["section_id", "student_id"], name: "index_sections_students_on_section_id_and_student_id"
    t.index ["student_id", "section_id"], name: "index_sections_students_on_student_id_and_section_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "major"
    t.boolean "is_undergraduate"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_students_on_user_id"
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
    t.string "university_id", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["university_id"], name: "index_users_on_university_id"
  end

  add_foreign_key "courses", "departments"
  add_foreign_key "departments", "instructors", column: "department_head_id"
  add_foreign_key "instructors", "departments"
  add_foreign_key "instructors", "users"
  add_foreign_key "prerequisites", "courses"
  add_foreign_key "prerequisites", "courses", column: "prerequisite_course_id"
  add_foreign_key "sections", "courses"
  add_foreign_key "sections", "instructors"
  add_foreign_key "students", "users"
end
