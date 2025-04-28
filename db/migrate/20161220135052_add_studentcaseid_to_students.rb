# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddStudentcaseidToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :student_caseid, :string
  end
end
