# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class CreateTextSnippets < ActiveRecord::Migration[5.2]
  def change
    create_table :text_snippets do |t|
      t.string :location
      t.text :text

      t.timestamps
    end
  end
end
