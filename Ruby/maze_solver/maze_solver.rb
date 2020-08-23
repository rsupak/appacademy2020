class Maze
  # Create neighboring delta array
  DELTAS = [
    [1, 0],
    [0, 1],
    [-1, 0],
    [0, -1],
    [1, 1],
    [-1, 1],
    [1, -1],
    [-1, -1]
  ].freeze

  attr_reader :start_ind, :end_ind
  # initialize Maze with maze file, load maze as an array
  # maze title should be filename (minus filetype)
  # set start_ind to index of 'S'
  # set end_ind to index of 'E'
  def initialize(filename)
    @map = load_map(filename)
    @title = parse_title(filename)
    @start_ind = find_start
    @end_ind = find_end
  end

  # load mapfile using File.open and read it into an array
  def load_map(filename)
    maze = []
    File.open(filename).each_line do |line|
      chars = line.split('')
      maze << chars
    end
    maze
  end


  def wall?(point)
    x, y = point
    @map[y][x] == '*'
  end

  def in_maze?(point)
    x, y = point
    not_negative = (x >= 0) && (y >= 0)
    within_bounds = (x <= @map[0].length) && (y <= @map.length)
    not_negative && within_bounds
  end

  def parse_title(filename)
    filename.match(/(.+)\.txt/)[1]
  end

  def to_s
    string = "MAZE: #{@title}\n"
    @map.each { |line| string << line.join('') }
    string
  end

  def find_start
    find_char('S')
  end

  def find_end
    find_char('E')
  end

  def find_char(char)
    @map.each.with_index do |line, y|
      return [line.index(char), y] if line.index(char)
    end
  end

  def find_neighbors(point)
    p_x, p_y = point
    neighbors = []
    DELTAS.each do |d_x, d_y|
      neighbor = [(d_x + p_x), (d_y + p_y)]
      neighbors << neighbor if in_maze?(neighbor) && !wall?(neighbor)
    end
    neighbors
  end

  def travel_path(path)
    puts "Traveling path of #{path.inspect}"
    copy_map = deep_dup(@map)
    path.each do |coords|
      x, y = coords
      point = copy_map[y][x]
      if point == '0'
        puts "This path back-tracks to #{x}, #{y}."
      elsif point == '*'
        puts "This path hits a wall at #{x}, #{y}."
      else
        copy_map[y][x] = '0'
      end
    end
    show_path(copy_map)
  end

  def show_path(map)
    map.each do |line|
      puts line.join('')
    end
  end

  private

  def deep_dup(item)
    if item.class != Array
      item.dup
    else
      new_arr = []
      item.each do |i|
        new_arr << deep_dup(i)
      end
      new_arr
    end
  end
end

class Maze_Solver

  def initialize(maze)
    @maze = maze
    reset_values
  end

  # find distance from point to the end of the maze
  def find_distance(point)
    p_x, p_y = point
    final_x, final_y = @maze.find_end
    ((p_x - final_x) + (p_y - final_y)).abs
  end

  def find_manhattan_estimate(point)
    dist_to_end = find_distance(point)
    dist_traveled = find_path(point).length
    dist_to_end + dist_traveled
  end

  def manhattan_heuristic(queue)
    queue.inject do |chosen_point, point|
      old_f = find_manhattan_estimate(chosen_point)
      new_f = find_manhattan_estimate(point)
      old_f > new_f ? point : chosen_point
    end
  end

  def build_branching_paths(heuristic = :manhattan_heuristic)
    reset_values
    queue = [@current]
    visited = [@current]

    until queue.empty? || @current == @maze.find_end
      @current = self.send(heuristic, queue)
      queue.delete(@current)
      visited << @current
      nearby_openings = @maze.find_neighbors(@current)
      nearby_openings.each do |neighbor|
        unless visited.include?(neighbor) || queue.include?(neighbor)
          queue << neighbor
          @branching_paths[neighbor] = @current
        end
      end
    end
      @branching_paths
  end

  def find_path(goal = @maze.find_end)
    path = [goal]
    spot = goal
    until @branching_paths[spot].nil?
      path << @branching_paths[spot]
      spot = @branching_paths[spot]
    end
    path
  end

  def solve(heuristic = :manhattan_heuristic)
    build_branching_paths(heuristic)
    path = find_path
    @maze.travel_path(path)
  end

  private
  
  def reset_values
    @branching_paths = {}
    @current = @maze.find_start
  end
end

if __FILE__ == $PROGRAM_NAME
  filename = ARGV[0] || 'maze1.txt'
  test_maze = Maze.new(filename)
  puts test_maze
  puts "Start is at #{test_maze.start_ind}"
  puts "End is at #{test_maze.end_ind}"
  test_solver = Maze_Solver.new(test_maze)
  test_solver.solve
end
