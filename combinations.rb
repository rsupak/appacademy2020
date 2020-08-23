def combinations(arr)
  result = []
  arr.each.with_index do |e1, i|
    arr.each.with_index do |e2, j|
      result << [e1, e2] if i < j
    end
  end
  result
end


print combinations(["a", "b", "c"]); # => [ [ "a", "b" ], [ "a", "c" ], [ "b", "c" ] ]
puts

print combinations([0, 1, 2, 3]); # => [ [ 0, 1 ], [ 0, 2 ], [ 0, 3 ], [ 1, 2 ], [ 1, 3 ], [ 2, 3 ] ]
puts
