# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RenameStudentPreferencesTable < ActiveRecord::Migration[7.1]
  def up
    rename_table :student_preferences, :preferences_students
  end

  def down
    rename_table :preferences_students, :student_preferences
  end
end
