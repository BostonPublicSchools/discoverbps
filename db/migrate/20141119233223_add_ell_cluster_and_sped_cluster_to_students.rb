# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddEllClusterAndSpedClusterToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :ell_cluster, :string
    add_column :students, :sped_cluster, :string
    add_column :students, :zone, :string
  end
end
