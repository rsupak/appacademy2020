class Item
  attr_accessor :title, :description, :done
  attr_reader :deadline

  def self.valid_date?(date_string)
    date_array = date_string.split('-').map!(&:to_i)
    return false unless date_array[0] >= 0 && date_array[0] <= 9999
    return false unless date_array[1].positive? && date_array[1] <= 12
    return false unless date_array[2].positive? && date_array[2] <= 31

    true
  end

  def initialize(title, deadline, description = '')
    @title = title
    @description = description
    raise SyntaxError, 'Invalid Date' unless Item.valid_date?(deadline)

    @deadline = deadline
    @done = false
  end

  def deadline=(new_deadline)
    raise SyntaxError, 'Invalid Date' unless Item.valid_date?(new_deadline)

    @deadline = new_deadline
  end

  def toggle
    @done = !@done
  end
end
