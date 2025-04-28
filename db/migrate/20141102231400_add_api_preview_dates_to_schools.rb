# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddApiPreviewDatesToSchools < ActiveRecord::Migration[7.1]
  def change
    add_column :schools, :api_preview_dates, :text
  end
end
