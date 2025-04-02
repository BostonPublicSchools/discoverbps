# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RenameIncludeInDialogBoxToQualitativeFeatures < ActiveRecord::Migration[5.2]
  def up
    rename_column :preference_categories, :include_in_dialog_box, :qualitative_criteria
  end

  def down
    rename_column :preference_categories, :qualitative_criteria, :include_in_dialog_box
  end
end
