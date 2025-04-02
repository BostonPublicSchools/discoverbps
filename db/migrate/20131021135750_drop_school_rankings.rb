# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class DropSchoolRankings < ActiveRecord::Migration[5.2]
  # def up
  # 	drop_table :school_rankings
  # end

  # def down
  #   create_table :school_rankings do |t|
  #     t.integer :user_id
  #     t.integer :student_id
  #     t.text :sorted_school_ids

  #     t.timestamps
  #   end
  #   add_index :school_rankings, :user_id
  #   add_index :school_rankings, :student_id
  # end
end
