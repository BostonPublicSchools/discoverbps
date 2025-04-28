# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddExamSchoolToStudentSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :student_schools, :exam_school, :boolean, default: false
  end
end
