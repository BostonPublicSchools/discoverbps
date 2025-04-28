# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class SetSpedNeedsDefaultToFalse < ActiveRecord::Migration[7.1]
  def up
    change_column :students, :sped_needs, :boolean, default: false
  end

  def down
  end
end
