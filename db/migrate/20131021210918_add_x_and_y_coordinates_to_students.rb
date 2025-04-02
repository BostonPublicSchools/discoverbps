# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddXAndYCoordinatesToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :x_coordinate, :float
    add_column :students, :y_coordinate, :float
  end
end
