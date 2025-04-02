# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class ChangeEllLanguageToDefaultNil < ActiveRecord::Migration[5.2]
  def up
    change_column :students, :ell_language, :string, default: nil
  end

  def down; end
end
