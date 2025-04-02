# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddEligibilityToStudentSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :student_schools, :eligibility, :string
  end
end
