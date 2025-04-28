# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddIndexOnTokenOnStudents < ActiveRecord::Migration[7.1]
  def up
    add_index :students, :token
  end

  def down
    remove_index :students, :token
  end
end
