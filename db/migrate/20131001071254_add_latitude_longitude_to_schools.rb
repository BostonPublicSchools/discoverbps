# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddLatitudeLongitudeToSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :schools, :latitude, :float
    add_column :schools, :longitude, :float
  end
end
