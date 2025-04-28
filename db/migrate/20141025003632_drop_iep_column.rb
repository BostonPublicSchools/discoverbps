# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class DropIepColumn < ActiveRecord::Migration[7.1]
  def up
    remove_column :students, :iep
  end

  def down
    add_column :students, :iep, :string
  end
end
