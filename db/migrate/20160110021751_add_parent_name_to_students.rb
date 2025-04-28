# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddParentNameToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :parent_name, :string
  end
end
