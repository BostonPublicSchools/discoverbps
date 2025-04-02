# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class CreateStoredSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :stored_searches do |t|
      t.text :json

      t.timestamps
    end
  end
end
