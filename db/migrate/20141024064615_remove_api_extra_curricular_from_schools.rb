# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RemoveApiExtraCurricularFromSchools < ActiveRecord::Migration[5.2]
  def up
    remove_column :schools, :api_extra_curricular
  end

  def down
    add_column :schools, :api_extra_curricular, :text
  end
end
