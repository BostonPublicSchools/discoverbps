# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddPreferencesCountToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :preferences_count, :integer, default: 0
  end
end
