# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddNeighborhoodToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :neighborhood, :string
  end
end
