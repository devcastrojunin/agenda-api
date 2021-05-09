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

ActiveRecord::Schema.define(version: 2021_05_09_003755) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_students", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "class_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["class_id"], name: "index_class_students_on_class_id"
    t.index ["student_id"], name: "index_class_students_on_student_id"
  end

  create_table "classes", force: :cascade do |t|
    t.string "nome"
    t.boolean "status"
    t.bigint "matter_id", null: false
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["matter_id"], name: "index_classes_on_matter_id"
    t.index ["teacher_id"], name: "index_classes_on_teacher_id"
  end

  create_table "matters", force: :cascade do |t|
    t.string "nome"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "nome"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "nome"
    t.string "email"
    t.boolean "status"
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_students_on_role_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.string "nome"
    t.boolean "status"
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_teachers_on_role_id"
  end

  add_foreign_key "class_students", "classes"
  add_foreign_key "class_students", "students"
  add_foreign_key "classes", "matters"
  add_foreign_key "classes", "teachers"
  add_foreign_key "students", "roles"
  add_foreign_key "teachers", "roles"
end
