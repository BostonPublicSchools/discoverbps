# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class CreateSchools < ActiveRecord::Migration[7.1]
  def change
    create_table :schools, &:timestamps
  end
end
