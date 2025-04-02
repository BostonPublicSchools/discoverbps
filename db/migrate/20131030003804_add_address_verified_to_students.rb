# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddAddressVerifiedToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :address_verified, :boolean, default: false
  end
end
