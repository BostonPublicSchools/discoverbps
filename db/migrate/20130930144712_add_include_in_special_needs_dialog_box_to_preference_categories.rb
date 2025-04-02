# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddIncludeInSpecialNeedsDialogBoxToPreferenceCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :preference_categories, :include_in_special_needs_dialog_box, :boolean, default: false
  end
end
