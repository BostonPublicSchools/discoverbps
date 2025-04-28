# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddRankedToStudentSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :student_schools, :ranked, :boolean, default: false
  end
end
