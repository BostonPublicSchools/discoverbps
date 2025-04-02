# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddLastSyncedToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :last_synced, :datetime, default: nil
  end
end
