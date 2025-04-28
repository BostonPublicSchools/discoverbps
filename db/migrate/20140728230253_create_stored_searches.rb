# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class CreateStoredSearches < ActiveRecord::Migration[7.1]
  def change
    create_table :stored_searches do |t|
      t.text :json

      t.timestamps
    end
  end
end
