# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddAddressidToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :addressid, :string
  end
end
