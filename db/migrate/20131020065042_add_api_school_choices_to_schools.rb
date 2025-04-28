# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddApiSchoolChoicesToSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :api_school_choices, :text
    add_column :students, :api_school_choices_created_at, :time
  end
end
