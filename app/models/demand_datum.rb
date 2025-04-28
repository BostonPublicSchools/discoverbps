# frozen_string_literal: true

class DemandDatum < ApplicationRecord
  belongs_to :school
  # TODO: remove since rails 5 no longer support, but kept for testing
  # attr_accessible :school_id, :bps_id, :year, :grade_level, :seats_before_round, :seats_after_round, :total_seats,
  #                 :first_choice_applicants, :second_choice_applicants, :third_choice_applicants, :total_applicants, :applicants_per_open_seat

  before_save :set_total_applicants_if_blank!
  before_save :calculate_applicants_per_open_seat!

  validates :school_id, :grade_level, presence: true

  private

  def set_total_applicants_if_blank!
    if total_applicants.blank? && first_choice_applicants.present? && second_choice_applicants.present? && third_choice_applicants.present?
      self.total_applicants = first_choice_applicants.to_i + second_choice_applicants.to_i + third_choice_applicants.to_i
    end
  end

  def calculate_applicants_per_open_seat!
    count = if total_applicants.present? && seats_before_round.present?
      if total_applicants.zero? || seats_before_round.zero?
        0
      else
        (total_applicants.to_f / seats_before_round)
      end
    end
    self.applicants_per_open_seat = count.try(:round, 1)
  end
end
