# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  (0..num).reduce { |acc, n| prime?(n) && (num % n).zero? ? n : acc }
end

def prime?(num)
  return false if num < 2

  (2..Math.sqrt(num)).each do |n|
    return false if (num % n).zero?
  end
  true
end

def unique_chars?(str)
  str.each_char do |c|
    return false if str.count(c) > 1
  end
  true
end

def dupe_indices(arr)
  dupes = Hash.new { |h, k| h[k] = [] }
  arr.each.with_index { |el, i| dupes[el] << i if arr.count(el) > 1 }
  dupes
end

def ana_array(arr1, arr2)
  return false unless arr1.size == arr2.size

  arr1.each do |el|
    return false unless arr1.count(el) == arr2.count(el)
  end
  true
end
