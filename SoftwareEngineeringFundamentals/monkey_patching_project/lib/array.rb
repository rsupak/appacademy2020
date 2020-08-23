# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if empty?

    max - min if all? { |el| el.is_a?(Numeric) }
  end

  def average
    return nil if empty?

    sum / size.to_f if all? { |el| el.is_a?(Numeric) }
  end

  def median
    return nil if empty?

    size.odd? ? sort[size / 2] : (sort[size / 2 - 1] + sort[size / 2]).to_f / 2
  end

  def counts
    count_hash = Hash.new(0)
    each { |el| count_hash[el] += 1 }
    count_hash
  end

  def my_count(value)
    counts[value] || 0
  end

  def my_index(value)
    each_index { |i| return i if self[i] == value }
    nil
  end

  def my_uniq
    counts.keys
  end

  def my_transpose
    (0...size).each do |i|
      (i...size).each do |j|
        self[i][j], self[j][i] = self[j][i], self[i][j]
      end
    end
    self
  end
end
