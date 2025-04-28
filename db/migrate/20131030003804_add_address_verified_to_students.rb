# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddAddressVerifiedToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :address_verified, :boolean, default: false
  end
end
