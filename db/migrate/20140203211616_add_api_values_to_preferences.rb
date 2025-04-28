# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddApiValuesToPreferences < ActiveRecord::Migration[7.1]
  def change
    add_column :preferences, :api_table_name, :string
    add_column :preferences, :api_table_key, :string
    add_column :preferences, :api_table_value, :string
  end
end
