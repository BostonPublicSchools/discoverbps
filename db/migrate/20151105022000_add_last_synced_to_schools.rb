# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddLastSyncedToSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :schools, :last_synced, :datetime, default: nil
  end
end
