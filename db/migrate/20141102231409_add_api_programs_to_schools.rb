# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddApiProgramsToSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :schools, :api_programs, :text
  end
end
