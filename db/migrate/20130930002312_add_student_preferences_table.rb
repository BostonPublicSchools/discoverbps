# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddStudentPreferencesTable < ActiveRecord::Migration[5.2]
  def up
    create_table :student_preferences, id: false do |t|
      t.references :student, null: false
      t.references :preference, null: false
    end
    add_index :student_preferences, %i[student_id preference_id], unique: true
  end

  def down
    drop_table :student_preferences
  end
end
