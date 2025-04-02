# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddIepEllToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :iep_needs, :boolean, default: false
    add_column :students, :ell_needs, :boolean, default: false
  end
end
