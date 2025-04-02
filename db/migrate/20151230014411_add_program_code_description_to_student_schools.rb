# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddProgramCodeDescriptionToStudentSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :student_schools, :program_code_description, :text
  end
end
