# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class SetStudentStepToDefaultOf1 < ActiveRecord::Migration[7.1]
  def up
    change_column_default(:students, :step, 1)
  end

  def down
    change_column_default(:students, :step, 0)
  end
end
