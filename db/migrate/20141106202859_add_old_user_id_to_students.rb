# frozen_string_literal: true

# This migration adds columns to the student_school table
class AddOldUserIdToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :old_user_id, :integer
    add_column :students, :old_session_id, :string
  end
end
