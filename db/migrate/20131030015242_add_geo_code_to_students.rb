# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddGeoCodeToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :geo_code, :string
  end
end
