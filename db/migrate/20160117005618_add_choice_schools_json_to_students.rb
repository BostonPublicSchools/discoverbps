# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class AddChoiceSchoolsJsonToStudents < ActiveRecord::Migration[7.1]
  def change
    add_column :students, :choice_schools_json, :text
  end
end
