# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RemoveApiSchoolChoicesFromStudents < ActiveRecord::Migration[7.1]
  def up
    remove_column :students, :api_school_choices
  end

  def down
    add_column :students, :api_school_choices, :text
  end
end
