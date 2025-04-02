# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddSpecialAdmissionsToStudentSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :student_schools, :special_admissions, :string
  end
end
