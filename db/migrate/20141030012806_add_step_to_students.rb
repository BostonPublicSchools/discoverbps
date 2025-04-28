# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddStepToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :step, :integer, default: 0
  end
end
