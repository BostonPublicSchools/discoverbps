# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddIncludeInPreferencesPanelToPreferenceCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :preference_categories, :include_in_preferences_panel, :boolean, default: true
  end
end
