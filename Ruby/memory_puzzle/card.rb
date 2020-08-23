class Card
  VALUES = ('A'..'Z').to_a

  def self.shuffle_pairs(num_pairs)
    values = VALUES

    while num_pairs > values.length
      values += values
    end

    values = values.shuffle.take(num_pairs) * 2
    values.shuffle!
    values.map { |val| self.new(val) }
  end

  attr_reader :value
  def initialize(value)
    @value = value
    @revealed = false
  end

  def hide
    @revealed = false
  end

  def reveal
    @revealed = true
  end

  def to_s
    revealed? ? value.to_s : ' '
  end

  def revealed?
    @revealed
  end

  def ==(other)
    other.is_a?(self.class) && other.value == @value
  end
end
