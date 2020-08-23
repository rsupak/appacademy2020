def range(start, finish)
  return [] if start == finish

  [start] + range(start + 1, finish)
end

def exp_1(base, power)
  return 1 if power.zero?

  base * exp_1(base, power - 1)
end

def exp_2(base, power)
  return 1 if power.zero?
  return base if power == 1

  next_step = if power.even?
                exp_2(base, power / 2) * exp_2(base, power / 2)
              else
                exp_2(base, (power - 1) / 2) * exp_2(base, (power - 1) / 2)
              end
  base * next_step
end

class Array
  def deep_dup
    new_arr = []
    each do |el|
      new_arr << if el.is_a?(Array)
                   el.deep_dup
                 else
                   el
                 end
    end
    new_arr
  end

  def merge_sort
    return self unless size > 1

    mid = size / 2
    left = self[0...mid].merge_sort
    right = self[mid..-1].merge_sort

    merge(left, right)
  end

  def merge(left, right)
    sorted = []
    sorted << (left[0] < right[0] ? left.shift : right.shift) until [left,right].any?(&:empty?)
    sorted + left + right
  end
end

def fib_recursive(num)
  return [0, 1].take(num) if num <= 2

  fib_arr = fib_recursive(num - 1)
  fib_arr << fib_arr[-2] + fib_arr[-1]
end

def fib_iterative(num)
  return [] if num.zero?
  return [0] if num == 1

  fib_arr = [0, 1]
  fib_arr << fib_arr[-1] + fib_arr[-2] until fib_arr.size == num
  fib_arr
end

def binary_search(arr, tgt)
  return nil if arr.empty?

  idx = arr.length / 2
  return idx if tgt == arr[idx]

  if tgt < arr[idx]
    binary_search(arr.take(idx), tgt)
  else
    idx + 1 + binary_search(arr[idx + 1..-1], tgt)
  end
end
arr = [1,2,3,4,5,6,7]


