# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class CreatePreferences < ActiveRecord::Migration[7.1]
  def change
    create_table :preferences do |t|
      t.integer :preference_category_id
      t.string :name

      t.timestamps
    end
    add_index :preferences, :preference_category_id
  end
end
