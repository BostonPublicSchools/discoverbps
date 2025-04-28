# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddSlugToSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :schools, :slug, :string
    add_index :schools, :slug, unique: true
  end
end
