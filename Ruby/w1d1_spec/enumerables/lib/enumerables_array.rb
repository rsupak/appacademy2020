class Array
  def my_each
    size.times do |i|
      yield self[i]
    end
    self
  end

  def my_select
    selected = []
    my_each { |i| selected << i if yield i }
    selected
  end

  def my_reject
    selected = []
    my_each { |i| selected << i unless yield i }
    selected
  end

  def my_any?
    my_each do |i|
      return true if yield i
    end
    false
  end

  def my_all?
    my_each do |i|
      return false unless yield i
    end
    true
  end

  def my_flatten
    flattened = []
    my_each do |i|
      i.is_a?(Array) ? flattened += i.my_flatten : flattened << i
    end
    flattened
  end

  def my_zip(*args)
    zipped = []
    size.times do |i|
      sub_arr = [self[i]]
      args.my_each do |el|
        sub_arr << el[i]
      end
      zipped << subarr
    end
    zipped
  end

  def my_rotate(n = 1)
    arr = dup
    if n.positive?
      n.times { arr = arr[1..-1] + arr[0..0] }
    else
      (-n).times { arr = arr[-1..-1] + arr[0..-2] }
    end
    arr
  end

  def my_join(twix = '')
    str = ''
    (0...size - 1).to_a.my_each { |i| str += self[i] + twix }
    str + self[-1]
  end

  def my_reverse
    new_arr = []
    (size - 1).downto(0).to_a.my_each do |i|
      new_arr << self[i]
    end
    new_arr
  end
end
