# frozen_string_literal: true

# This migration adds the dese_tier column to the student_schools table.
class AddDeseTierToStudentSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :student_schools, :dese_tier, :string
  end
end
