# frozen_string_literal: true

# This migration adds/changes fields in the respective table
class RenameEllNeedsToEllLanguage < ActiveRecord::Migration[7.1]
  def up
    change_column :students, :ell_needs, :string
    rename_column :students, :ell_needs, :ell_language
  end

  def down
    rename_column :students, :ell_language, :ell_needs
  end
end
