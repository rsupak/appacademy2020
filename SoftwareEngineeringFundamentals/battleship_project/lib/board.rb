class Board
  attr_reader :size
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  # accepts and position array [row, col] => returns grid[row][col]
  def [](pos)
    row = pos.first
    col = pos.last
    @grid[row][col]
  end

  # accepts a position array [row, col] and a value => sets grid[row][col] = value
  def[]=(pos, value)
    row = pos.first
    col = pos.last
    @grid[row][col] = value
  end

  # returns number of ships (:S) in grid
  def num_ships
    @grid.reduce(0) { |acc, el| acc + el.count(:S) }
  end

  # accepts a position array [row, col] to check and set values in the grid
  def attack(pos)
    if self[pos] == :S
      self[pos] = :H
      puts 'You sunk my battleship!'
      true
    else
      self[pos] = :X
      false
    end
  end

  # randomly sets 1/4 (25%) of grid elements to ships
  def place_random_ships
    ship_count = size / 4
    while ship_count.positive?
      row = rand(@grid.size)
      col = rand(@grid.size)
      if self[[row, col]] == :N
        self[[row, col]] = :S
        ship_count -= 1
      end
    end
  end

  # returns a grid where every :S is replaced with an :N without mutating original grid
  def hidden_ships_grid
    hidden = Array.new(@grid.size) { [] }
    (0...@grid.size).each do |i|
      (0...@grid.size).each do |j|
        chit = self[[i, j]] == :S ? :N : self[[i, j]]
        hidden[i] << chit
      end
    end
    hidden
  end

  # accepts a grid as an argument and puts the grid to console
  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(' ')
    end
  end

  # print the Board
  def cheat
    Board.print_grid(@grid)
  end

  # print the hidden grid
  def print
    Board.print_grid(hidden_ships_grid)
  end
end
