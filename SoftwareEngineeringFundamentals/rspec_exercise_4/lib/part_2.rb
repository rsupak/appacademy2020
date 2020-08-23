def proper_factors(num)
  (1...num).select { |n| (num % n).zero? }
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  num == aliquot_sum(num)
end

def ideal_numbers(n)
  arr = []
  current = 1
  while arr.size < n
    arr << current if perfect_number?(current)
    current += 1
  end
  arr
end
