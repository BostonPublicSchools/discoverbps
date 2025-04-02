# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddSelectTypeToPreferenceCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :preference_categories, :select_type, :string, default: 'check_mark'
  end
end
