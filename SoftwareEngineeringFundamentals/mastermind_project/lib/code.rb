class Code
  attr_reader :pegs
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(pegs)
    pegs.all? { |p| Code::POSSIBLE_PEGS.include?(p.upcase) }
  end

  def self.random(length)
    Code.new(Array.new(length) { Code::POSSIBLE_PEGS.keys.sample })
  end

  def self.from_string(code_string)
    Code.new(code_string.split(''))
  end

  def initialize(pegs)
    raise unless Code.valid_pegs?(pegs)

    @pegs = pegs.map(&:upcase)
  end

  def [](index)
    pegs[index]
  end

  def length
    pegs.size
  end

  def num_exact_matches(guess)
    (0...guess.length).count { |i| guess[i] == self[i] }
  end

  def num_near_matches(guess)
    return 0 if self == guess

    matches = (0...guess.length).count { |i| pegs.include?(guess[i]) }
    matches - num_exact_matches(guess)
  end

  def ==(other)
    pegs == other.pegs
  end
end
