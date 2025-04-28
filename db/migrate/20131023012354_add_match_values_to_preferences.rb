# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddMatchValuesToPreferences < ActiveRecord::Migration[7.1]
  def change
    add_column :preferences, :match_values, :text
  end
end
