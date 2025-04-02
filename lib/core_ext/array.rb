# frozen_string_literal: true

class Array
  def safe_transpose
    result = []
    max_size = max { |a, b| a.size <=> b.size }.size
    max_size.times do |i|
      result[i] = Array.new(size)
      each_with_index { |r, j| result[i][j] = r[i] }
    end
    result
  end
end
