# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddApiStudentSupportToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :api_student_support, :text
  end
end
