require_relative 'card'

class Board
  attr_reader :size
  def initialize(size = 4)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
    populate
  end

  def populate
    num_pairs = (size**2) / 2
    cards = Card.shuffle_pairs(num_pairs)
    grid.each_index do |i|
      grid[i].each_index do |j|
        self[[i, j]] = cards.shift
      end
    end
  end

  def render
    system('clear') || system('cls')
    puts "  #{(0...size).to_a.join(' ')}"
    grid.each.with_index do |row, i|
      puts "#{i} #{row.join(' ')}"
    end
  end

  def reveal(pos)
    if revealed?(pos)
      puts "You can't flip a card that has already been revealed."
    else
      self[pos].reveal
    end
    self[pos].value
  end

  def hide(pos)
    self[pos].hide
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    grid[row][col] = value
  end

  def won?
    rows.all? { |row| row.all?(&:revealed?) }
  end

  def revealed?(pos)
    self[pos].revealed?
  end

  private

  attr_reader :grid
end
