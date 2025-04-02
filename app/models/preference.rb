# frozen_string_literal: true

class Preference < ApplicationRecord
  include RankedModel
  ranks :sort_order

  belongs_to :preference_category

  # TODO: remove since rails 5 no longer support, but kept for testing
  # attr_accessible :name, :preference_category_id, :grade_k0, :grade_k1, :grade_k2, :grade_1, :grade_2, :grade_3,
  #                 :grade_4, :grade_5, :grade_6, :grade_7, :grade_8, :grade_9, :grade_10, :grade_11, :grade_12, :api_table_name, :api_table_key, :api_table_value, :sort_order_position

  before_save :strip_api_table_key, :strip_api_table_value

  private

  def strip_api_table_key
    api_table_key.try(:strip!)
  end

  def strip_api_table_value
    api_table_value.try(:strip!)
  end
end
