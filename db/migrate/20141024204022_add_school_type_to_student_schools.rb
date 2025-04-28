# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddSchoolTypeToStudentSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :student_schools, :school_type, :string
    add_index :student_schools, :school_type
  end
end
