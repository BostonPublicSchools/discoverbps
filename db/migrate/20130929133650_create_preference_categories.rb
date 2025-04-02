# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class CreatePreferenceCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :preference_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
