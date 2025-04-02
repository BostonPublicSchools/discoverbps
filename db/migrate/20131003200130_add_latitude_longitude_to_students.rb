# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddLatitudeLongitudeToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :latitude, :float
    add_column :students, :longitude, :float
  end
end
