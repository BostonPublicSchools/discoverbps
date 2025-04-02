# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddNameAndBpsIdToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :name, :string
    add_column :schools, :bps_id, :integer
  end
end
