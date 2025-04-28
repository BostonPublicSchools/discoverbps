# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RemoveApiCalendarFromSchools < ActiveRecord::Migration[7.1]
  def up
    remove_column :schools, :api_calendar
  end

  def down
    add_column :schools, :api_calendar, :text
  end
end
