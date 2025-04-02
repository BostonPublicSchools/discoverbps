# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddJsonResponseObjectsToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :home_schools_json, :text
    add_column :students, :zone_schools_json, :text
    add_column :students, :ell_schools_json, :text
    add_column :students, :sped_schools_json, :text
  end
end
