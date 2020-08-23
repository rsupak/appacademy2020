require_relative 'item'
require_relative 'list'

class TodoBoard
  def initialize
    @lists = {}
  end

  def get_command
    print "\nEnter a command: "
    cmd, list, *args = gets.chomp.split(' ')

    case cmd
    when 'mklist'
      @lists[list] = List.new(list)
    when 'ls'
      @lists.keys.each { |key| puts @lists[key].label }
    when 'showall'
      @lists.keys.each { |key| @lists[key].print }
    when 'mktodo'
      @lists[list].add_item(*args)
    when 'up'
      args.map!(&:to_i)
      @lists[list].up(*args)
    when 'down'
      args.map!(&:to_i)
      @lists[list].down(*args)
    when 'swap'
      args.map!(&:to_i)
      @lists[list].swap(*args)
    when 'sort'
      @lists[list].sort_by_date!
    when 'priority'
      @lists[list].print_priority
    when 'print'
      args.empty? ? @lists[list].print : @lists[list].print_full_item(args[0].to_i)
    when 'toggle'
      @lists[list].toggle_item(args[0].to_i)
    when 'rm'
      @lists[list].remove_item(args[0].to_i)
    when 'purge'
      @lists[list].purge
    when 'quit'
      return false
    else
      print 'Sorry, that command is not recognized.'
    end

    true
  end

  def run
    running = true
    running = get_command while running
  end
end

my_board = TodoBoard.new
my_board.run
