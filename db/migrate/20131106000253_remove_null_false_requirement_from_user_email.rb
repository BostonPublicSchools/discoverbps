# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RemoveNullFalseRequirementFromUserEmail < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :email, :string, null: true
  end

  def down
    change_column :users, :email, :string, null: false
  end
end
