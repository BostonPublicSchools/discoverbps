# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddCallIdAndProgramCodeToStudentSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :student_schools, :call_id, :string
    add_column :student_schools, :program_code, :string
  end
end
