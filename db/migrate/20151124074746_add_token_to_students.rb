# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddTokenToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :token, :text
  end
end
