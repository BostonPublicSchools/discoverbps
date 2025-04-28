# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class ConvertEligibilityToTextOnStudentSchools < ActiveRecord::Migration[7.1]
  def up
    change_column :student_schools, :eligibility, :text
  end

  def down
    change_column :student_schools, :eligibility, :string
  end
end
