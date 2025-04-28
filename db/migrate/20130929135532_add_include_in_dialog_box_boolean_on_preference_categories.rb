# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddIncludeInDialogBoxBooleanOnPreferenceCategories < ActiveRecord::Migration[7.1]
  def change
    add_column :preference_categories, :include_in_dialog_box, :boolean, default: true
  end
end
