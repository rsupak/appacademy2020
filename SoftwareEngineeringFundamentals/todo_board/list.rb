require_relative 'item'

class List
  attr_accessor :label
  attr_reader :items

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description = '')
    begin
      item = Item.new(title, deadline, description)
    rescue SyntaxError => e
      puts e
      return false
    end

    @items << item
    true
  end

  def size
    @items.size
  end

  def valid_index?(index)
    !@items[index].nil? && !index.negative?
  end

  def swap(index1, index2)
    if valid_index?(index1) && valid_index?(index2)
      @items[index1], @items[index2] = @items[index2], @items[index1]
      return true
    end
    false
  end

  def [](index)
    valid_index?(index) ? @items[index] : nil
  end

  def priority
    @items.first
  end

  def print
    line_pad = '----------------------------------------------'
    puts line_pad
    puts @label.upcase.center(line_pad.size)
    puts line_pad
    puts 'Index | Item              | Deadline   | Done'
    puts line_pad
    @items.each.with_index do |item, i|
      puts "#{i.to_s.ljust(5)} | #{item.title.ljust(17)} | #{item.deadline.ljust(10)} | #{item.done ? "[\u2714]" : '[ ]'}"
    end
    puts line_pad
  end

  def print_full_item(index)
    item = @items[index]
    line_pad = '----------------------------------------------'
    puts line_pad
    puts "#{item.title.ljust(line_pad.size - 21)} #{item.deadline.ljust(8)}     #{item.done ? "[\u2714]" : '[ ]'}"
    puts item.description.ljust(line_pad.size).to_s
    puts line_pad
  end

  def print_priority
    print_full_item(0)
  end

  def up(index, amount = 1)
    return false unless valid_index?(index)

    while amount.positive? && index.positive?
      @items[index], @items[index - 1] = @items[index - 1], @items[index]
      index -= 1
      amount -= 1
    end
    true
  end

  def down(index, amount = 1)
    return false unless valid_index?(index)

    until amount.zero? || index == @items.size - 1
      @items[index], @items[index + 1] = @items[index + 1], @items[index]
      index += 1
      amount -= 1
    end
    true
  end

  def sort_by_date!
    @items.sort_by!(&:deadline)
  end

  def toggle_item(index)
    return false unless valid_index?(index)

    @items[index].toggle
    true
  end

  def remove_item(index)
    return false unless valid_index?(index)

    @items.delete_at(index)
    true
  end

  def purge
    @items.reject! { |item| item.done }
  end
end
