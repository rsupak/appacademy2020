# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  new_str = ''
  char = str[0]
  count = 1
  (1..str.size).each do |i|
    if str[i] != char || i == str.size
      new_str += count == 1 ? char : count.to_s + char
      count = 1
      char = str[i] unless i == str.size
    else
      count += 1
    end
  end
  new_str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
