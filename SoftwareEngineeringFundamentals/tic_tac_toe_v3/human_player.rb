class HumanPlayer
  attr_reader :mark
  def initialize(mark)
    @mark = mark
  end

  def get_position(legal_positions)
    pos = nil
    until legal_positions.include?(pos)
      puts "Player #{@mark}, enter two numbers representing a position in the format row col"
      pos = gets.chomp.split.map!(&:to_i)
      puts "#{pos} is an invalid selection, choose again" if pos.size != 2 || !legal_positions.include?(pos)
    end
    puts "Player #{@mark} chose position #{pos}"
    pos
  end
end
