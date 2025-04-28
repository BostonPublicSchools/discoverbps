# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddAwcInvitationToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :awc_invitation, :boolean
  end
end
