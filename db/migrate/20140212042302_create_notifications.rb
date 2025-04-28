# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class CreateNotifications < ActiveRecord::Migration[7.1]
  def change
    create_table :notifications do |t|
      t.text :message
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
