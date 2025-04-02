# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RenameSiblingColumnsToPlurals < ActiveRecord::Migration[5.2]
  def up
    rename_column :students, :sibling_school_name, :sibling_school_names
    rename_column :students, :sibling_school_id, :sibling_school_ids
    change_column :students, :sibling_school_names, :text
    change_column :students, :sibling_school_ids, :text
  end

  def down
    rename_column :students, :sibling_school_names, :sibling_school_name
    rename_column :students, :sibling_school_ids, :sibling_school_id
    change_column :students, :sibling_school_name, :string
    change_column :students, :sibling_school_id, :integer
  end
end
