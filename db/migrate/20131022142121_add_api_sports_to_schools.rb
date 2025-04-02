# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddApiSportsToSchools < ActiveRecord::Migration[5.2]
  def change
    add_column :schools, :api_sports, :text
  end
end
