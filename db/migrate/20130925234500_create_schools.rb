# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class CreateSchools < ActiveRecord::Migration[5.2]
  def change
    create_table :schools, &:timestamps
  end
end
