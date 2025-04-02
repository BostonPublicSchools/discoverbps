# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RenameStudentApiSchoolChoicesCreatedAt < ActiveRecord::Migration[5.2]
  def up
    rename_column :students, :api_school_choices_created_at, :schools_last_updated_at
  end

  def down
    rename_column :students, :schools_last_updated_at, :api_school_choices_created_at
  end
end
