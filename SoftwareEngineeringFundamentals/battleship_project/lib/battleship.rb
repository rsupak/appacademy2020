require_relative "board"
require_relative "player"

class Battleship
  attr_reader :player, :board
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    puts "There are #{board.num_ships} remaining ships on the board."
    puts
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts 'you lose'
      true
    else
      false
    end
  end

  def win?
    if @board.num_ships.zero? && !lose?
      puts 'you win'
      true
    else
      false
    end
  end

  def game_over?
    win? || lose?
  end

  def turn
    move = player.get_move
    @board.attack(move)
    @board.print
    @remaining_misses -= 1 if @board[move] == :X
    puts "Misses Remaining: #{@remaining_misses}"
    puts "There are #{board.num_ships} remaining ships on the board."
  end
end
