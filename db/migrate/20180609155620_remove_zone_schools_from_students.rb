# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RemoveZoneSchoolsFromStudents < ActiveRecord::Migration[7.1]
  def change
    remove_column :students, :zone_schools_json
  end
end
