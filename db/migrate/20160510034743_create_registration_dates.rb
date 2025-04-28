# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class CreateRegistrationDates < ActiveRecord::Migration[7.1]
  def change
    create_table :registration_dates do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
