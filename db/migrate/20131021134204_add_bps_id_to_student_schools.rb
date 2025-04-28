# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddBpsIdToStudentSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :student_schools, :bps_id, :string
    add_index :student_schools, :bps_id
  end
end
