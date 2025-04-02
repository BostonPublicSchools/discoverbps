# frozen_string_literal: true

class RegistrationDate < ApplicationRecord
  # TODO: remove since rails 5 no longer support, but kept for testing
  # attr_accessible :start_date, :end_date, :name

  validates :name, :start_date, presence: true
  validates :name, uniqueness: true
end
