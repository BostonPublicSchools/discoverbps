# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class SetAwcInvitationToFalse < ActiveRecord::Migration[7.1]
  def up
    change_column :students, :awc_invitation, :boolean, default: false
  end

  def down
  end
end
