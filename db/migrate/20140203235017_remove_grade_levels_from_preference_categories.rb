# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RemoveGradeLevelsFromPreferenceCategories < ActiveRecord::Migration[5.2]
  def up
    remove_column :preference_categories, :grade_k0
    remove_column :preference_categories, :grade_k1
    remove_column :preference_categories, :grade_k2
    remove_column :preference_categories, :grade_1
    remove_column :preference_categories, :grade_2
    remove_column :preference_categories, :grade_3
    remove_column :preference_categories, :grade_4
    remove_column :preference_categories, :grade_5
    remove_column :preference_categories, :grade_6
    remove_column :preference_categories, :grade_7
    remove_column :preference_categories, :grade_8
    remove_column :preference_categories, :grade_9
    remove_column :preference_categories, :grade_10
    remove_column :preference_categories, :grade_11
    remove_column :preference_categories, :grade_12
  end

  def down
    add_column :preference_categories, :grade_k0, :boolean, default: false
    add_column :preference_categories, :grade_k1, :boolean, default: false
    add_column :preference_categories, :grade_k2, :boolean, default: false
    add_column :preference_categories, :grade_1, :boolean, default: false
    add_column :preference_categories, :grade_2, :boolean, default: false
    add_column :preference_categories, :grade_3, :boolean, default: false
    add_column :preference_categories, :grade_4, :boolean, default: false
    add_column :preference_categories, :grade_5, :boolean, default: false
    add_column :preference_categories, :grade_6, :boolean, default: false
    add_column :preference_categories, :grade_7, :boolean, default: false
    add_column :preference_categories, :grade_8, :boolean, default: false
    add_column :preference_categories, :grade_9, :boolean, default: false
    add_column :preference_categories, :grade_10, :boolean, default: false
    add_column :preference_categories, :grade_11, :boolean, default: false
    add_column :preference_categories, :grade_12, :boolean, default: false
  end
end
