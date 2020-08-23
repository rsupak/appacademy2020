# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.

def coprime?(*args)
  factors_hash = Hash.new { |k, v| k[v] = [] }

  args.each do |arg|
    (1..arg).each do |fact|
      factors_hash[arg] << fact if (arg % fact).zero?
    end
  end
  factors_hash.values.reduce { |acc, el| acc & el } == [1]
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
