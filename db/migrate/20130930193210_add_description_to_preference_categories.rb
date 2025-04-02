# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddDescriptionToPreferenceCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :preference_categories, :description, :text
  end
end
