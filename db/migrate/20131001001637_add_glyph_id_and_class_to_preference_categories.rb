# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddGlyphIdAndClassToPreferenceCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :preference_categories, :glyph_id, :string
    add_column :preference_categories, :glyph_class, :string
  end
end
