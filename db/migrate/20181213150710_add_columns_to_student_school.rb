# frozen_string_literal: true

# This migration adds columns to the student_school table
class AddColumnsToStudentSchool < ActiveRecord::Migration[7.1]
  def change
    add_column :student_schools, :tier_explanation, :string
    add_column :student_schools, :school_dese_accountability, :string
  end
end
