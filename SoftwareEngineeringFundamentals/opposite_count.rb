# frozen_string_literal: true

def opposite_count(nums)
  count = 0
  nums.each.with_index do |num, i|
    nums[i + 1..-1].each do |num2|
      count += 1 if (num + num2).zero?
    end
  end
  count
end

puts opposite_count([2, 5, 11, -5, -2, 7]) # => 2

# puts opposite_count([21, -23, 24, -12, 23]) # => 1
