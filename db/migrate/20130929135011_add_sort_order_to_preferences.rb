# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddSortOrderToPreferences < ActiveRecord::Migration[7.1]
  def change
    add_column :preference_categories, :sort_order, :integer
    add_column :preferences, :sort_order, :integer
  end
end
