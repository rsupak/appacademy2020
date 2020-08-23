def palindrome?(str)
  str.each_char.with_index do |_, i|
    return false if str[i] != str[-i - 1]
  end
  true
end

def substrings(str)
  string_array = []

  (0...str.size).each do |i|
    (i...str.size).each do |j|
      string_array << str[i..j] if j >= i
    end
  end
  string_array
end

def palindrome_substrings(str)
  substrings(str).select { |word| palindrome?(word) && word.size > 1 }
end
