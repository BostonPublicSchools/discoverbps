# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class SetSpedNeedsDefaultToFalse < ActiveRecord::Migration[5.2]
  def up
    change_column :students, :sped_needs, :boolean, default: false
  end

  def down; end
end
