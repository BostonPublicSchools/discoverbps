# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class DropIepColumn < ActiveRecord::Migration[5.2]
  def up
    remove_column :students, :iep
  end

  def down
    add_column :students, :iep, :string
  end
end
