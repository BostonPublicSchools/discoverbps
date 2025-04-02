# frozen_string_literal: true

# This class is responsible TextSnippets
class TextSnippet < ApplicationRecord
  extend FriendlyId
  friendly_id :location, use: :slugged

  def text?
    text.html_safe
  end

  def self.find(obj)
    friendly.find(obj)
  end
end
