# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class DropSchoolsStudentsTable < ActiveRecord::Migration[5.2]
  def up
    drop_table :schools_students
  end

  def down
    create_table :schools_students, id: false do |t|
      t.references :student, null: false
      t.references :school, null: false
    end
    add_index :schools_students, %i[student_id school_id], unique: true
  end
end
