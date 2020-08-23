require_relative 'board'
require_relative 'human_player'

class Game
  attr_reader :current_player

  def initialize(board_size, *player_marks)
    @board = Board.new(board_size)
    @players = player_marks.map! { |mark| HumanPlayer.new(mark) }
    @current_player = @players.first
  end

  def switch_turn
    @players.rotate!
    @current_player = @players.first
  end

  def play
    #while board contains empty positions
    while @board.empty_positions?
      # print board
      @board.to_s
      # get a position from the current player
      pos = @current_player.get_position
      # place current player's mark on the board
      @board.place_mark(pos, @current_player.mark)
      # check if the current player has won
      if @board.win?(@current_player.mark)
        # if they win, print victory message
        @board.to_s
        puts "Victory! #{@current_player.mark} wins!"
        return
      # if they did not win, switch turns
      else
        switch_turn
      end
    end
    # if no empty spaces, print draw message
    @board.to_s
    puts "It's a Draw..."
  end
end

game = Game.new(4, :A, :B, :C)
game.play
