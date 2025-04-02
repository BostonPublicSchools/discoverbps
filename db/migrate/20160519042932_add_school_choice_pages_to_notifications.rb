# frozen_string_literal: true

# This migration adds or modifies columns in the notifications table.
class AddSchoolChoicePagesToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :school_choice_pages, :boolean, default: false
  end
end
