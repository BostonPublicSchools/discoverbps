# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RemoveMatchValuesFromPreferences < ActiveRecord::Migration[7.1]
  def up
    remove_column :preferences, :match_values
  end

  def down
    add_column :preferences, :match_values, :text
  end
end
