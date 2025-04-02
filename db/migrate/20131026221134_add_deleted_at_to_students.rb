# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddDeletedAtToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :deleted_at, :datetime
  end
end
