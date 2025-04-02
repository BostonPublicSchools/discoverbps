# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddAttributesToStudents < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :student_id, :string
    add_column :students, :address_id, :string
    add_column :students, :ranked, :boolean, default: false
    add_column :students, :ranked_at, :datetime
  end
end
