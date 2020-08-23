class HumanPlayer
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end

  def get_position
    pos = nil
    until pos != nil && pos.size == 2 && pos.all? { |x| x.is_a?(Numeric) }
      puts "Player #{@mark}, enter two numbers representing a position in the format 0 2"
      pos = gets.chomp.split.map!(&:to_i)
      puts 'Invalid select, choose again!' if pos.size != 2
    end
    pos
  end
end
