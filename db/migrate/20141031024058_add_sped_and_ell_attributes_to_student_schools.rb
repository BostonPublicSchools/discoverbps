# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddSpedAndEllAttributesToStudentSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :student_schools, :sped_cluster, :string
    add_column :student_schools, :sped_description, :text
    add_column :student_schools, :ell_cluster, :string
    add_column :student_schools, :ell_description, :text
  end
end
