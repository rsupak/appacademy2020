class Board
  attr_accessor :grid
  def initialize(size = 3)
    @grid = Array.new(size) { Array.new(size) { '_' } }
  end

  def valid?(pos)
    (pos[0] >= 0 && pos[0] <= @grid.size) && (pos[1] >= 0 && pos[1] <= @grid.size)
  end

  def empty?(pos)
    self[pos] == '_'
  end

  def place_mark(pos, mark)
    raise 'invalid position' unless valid?(pos)
    raise 'Space Taken!' unless empty?(pos)

    self[pos] = mark
  end

  def [](pos)
    @grid[pos[0]][pos[1]]
  end

  def []=(pos, value)
    @grid[pos[0]][pos[1]] = value
  end

  def to_s
    @grid.each do |row|
      puts row.join(' ')
    end
    puts
  end

  def win_row?(mark)
    return true if @grid.any? { |row| row.uniq.size == 1 && row.uniq[0] == mark }

    false
  end

  def win_col?(mark)
    return true if @grid.transpose.any? { |row| row.uniq.size == 1 && row.uniq[0] == mark }

    false
  end

  def win_diagonal?(mark)
    test_dr = true
    test_dl = true

    (0...@grid.size).each do |i|
      test_dr = false unless @grid[i][i] == mark
    end

    j = @grid.size - 1
    (0...@grid.size).each do |i|
      test_dl = false unless @grid[i][j] == mark
      j -= 1
    end

    test_dr || test_dl
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @grid.each { |row| row.each { |col| return true if col == '_' } }
    false
  end

  def legal_positions
    positions = []
    (0...@grid.size).each do |i|
      (0...@grid.size).each do |j|
        positions << [i, j] if empty?([i, j])
      end
    end
    positions
  end
end
