# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RenameIepNeedsToSpedNeeds < ActiveRecord::Migration[5.2]
  def up
    rename_column :students, :iep_needs, :sped_needs
  end

  def down
    rename_column :students, :sped_needs, :iep_needs
  end
end
