# frozen_string_literal: true

class Notification < ApplicationRecord
  validates :message, presence: true
  validate :start_time_precedes_end_time

  def self.active(ids)
    if ids.blank?
      where('start_time < ? AND end_time > ?', Time.current, Time.current)
    else
      where('start_time < ? AND end_time > ? AND id NOT IN (?)', Time.current, Time.current, ids)
    end
  end

  def message?
    message&.html_safe
  end

  private

  def start_time_precedes_end_time
    return unless start_time.present? && end_time.present? && start_time >= end_time

    errors.add(:start_time, 'must precede end time')
  end
end
