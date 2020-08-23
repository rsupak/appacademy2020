require_relative 'board'
require_relative 'human_player'

class Game
  attr_reader :player1, :player2, :current_player

  def initialize(player1_mark, player2_mark)
    @board = Board.new
    @player1 = HumanPlayer.new(player1_mark)
    @player2 = HumanPlayer.new(player2_mark)
    @current_player = @player1
  end

  def switch_turn
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def play
    #while board contains empty positions
    while @board.empty_positions?
      # print board
      @board.print
      # get a position from the current player
      pos = @current_player.get_position
      # place mark on the board
      @board.place_mark(pos, @current_player.mark)
      # check if the player has won
      if @board.win?(@current_player.mark)
        # if they win, print victory message
        @board.print
        puts "Victory! #{@current_player.mark} wins!"
        return
      # if they did not win, switch turns
      else
        switch_turn
      end
    end
    # if no empty spaces, print draw message
    @board.print
    puts "It's a Draw..."
  end
end

game = Game.new(:X, :O)
game.play
