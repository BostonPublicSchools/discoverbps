# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddHomePageAndSchoolsPageToNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :home_page, :boolean, default: true
    add_column :notifications, :schools_page, :boolean, default: true
  end
end
