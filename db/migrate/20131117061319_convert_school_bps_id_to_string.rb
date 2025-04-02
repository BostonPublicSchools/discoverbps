# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class ConvertSchoolBpsIdToString < ActiveRecord::Migration[5.2]
  def up
    change_column :schools, :bps_id, :string
  end

  def down
    change_column :schools, :bps_id, :integer
  end
end
