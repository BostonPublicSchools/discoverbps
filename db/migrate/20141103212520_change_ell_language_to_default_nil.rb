# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class ChangeEllLanguageToDefaultNil < ActiveRecord::Migration[7.1]
  def up
    change_column :students, :ell_language, :string, default: nil
  end

  def down
  end
end
