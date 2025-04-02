# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RenameApiOtherProgramsToApiSurroundCare < ActiveRecord::Migration[5.2]
  def up
    rename_column :schools, :api_other_programs, :api_surround_care
  end

  def down
    rename_column :schools, :api_surround_care, :api_other_programs
  end
end
