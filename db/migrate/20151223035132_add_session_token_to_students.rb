# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddSessionTokenToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :session_token, :text
    add_index :students, :session_token
  end
end
