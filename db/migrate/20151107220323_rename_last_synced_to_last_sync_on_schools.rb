# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RenameLastSyncedToLastSyncOnSchools < ActiveRecord::Migration[5.2]
  def up
    rename_column :schools, :last_synced, :last_sync
  end

  def down
    rename_column :schools, :last_sync, :last_synced
  end
end
