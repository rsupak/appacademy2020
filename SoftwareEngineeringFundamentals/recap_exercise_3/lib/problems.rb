# Write a method #no_dupes?(arr) that accepts an array as an arg and returns
# a new array containing the elements that were not repeated in the array.

def no_dupes?(arr)
  new_arr = []
  arr.each_index do |i|
    new_arr << arr[i] unless (arr[0...i] + arr[i + 1..-1]).include?(arr[i])
  end
  new_arr
end

# Write a method no_consecutive_repeats?(arr) that accepts an array as an arg. 
# The method should return true if an element never appears consecutively in the 
# array; it should return false otherwise.

def no_consecutive_repeats?(arr)
  arr.each_index { |i| return false if arr[i] == arr[i + 1] }
  true
end

# Write a method char_indices(str) that takes in a string as an arg. The method
# should return a hash containing characters as keys. The value associated with 
# each key should be an array containing the indices where that character is 
# found.

def char_indices(str)
  char_hash = Hash.new { |h, k| h[k] = [] }
  str.each_char.with_index { |c, i| char_hash[c] << i }
  char_hash
end

# Write a method longest_streak(str) that accepts a string as an arg. The method 
# should return the longest streak of consecutive characters in the string. If 
# there are any ties, return the streak that occurs later in the string.

def longest_streak(str)
  streak = ''
  current = ''
  (0..str.size).each do |i|
    if str[i] == str[i - 1]
      current += str[i]
    else
      streak = current if current.size >= streak.length
      current = str[i]
    end
  end
  streak
end

# Write a method bi_prime?(num) that accepts a number as an arg and returns a 
# boolean indicating whether or not the number is a bi-prime. A bi-prime is a 
# positive integer that can be obtained by multiplying two prime numbers.

# For Example:

# 14 is a bi-prime because 2 * 7
# 22 is a bi-prime because 2 * 11
# 25 is a bi-prime because 5 * 5
# 24 is not a bi-prime because no two prime numbers have a product of 24

def bi_prime?(num)
  prime_facts = []
  (2...num).each do |n|
    prime_facts << n if (num % n).zero? && prime?(n)
  end

  prime_facts.each do |i|
    prime_facts.each { |j| return true if i * j == num }
  end
  false
end

def prime?(num)
  count = 0
  (2..Math.sqrt(num)).each { |n| count += 1 if (num % n).zero? }
  count.zero?
end

# vigenere_cipher
# A Caesar cipher takes a word and encrypts it by offsetting each letter in the 
# word by a fixed number, called the key. Given a key of 3, for example: 
# a -> d, p -> s, and y -> b.

# A Vigenere Cipher is a Caesar cipher, but instead of a single key, a sequence 
# of keys is used. For example, if we encrypt "bananasinpajamas" with the key 
# sequence 1, 2, 3, then the result would be "ccqbpdtkqqcmbodt":

# # Message:  b a n a n a s i n p a j a m a s
# # Keys:     1 2 3 1 2 3 1 2 3 1 2 3 1 2 3 1
# # Result:   c c q b p d t k q q c m b o d t
# Write a method vigenere_cipher(message, keys) that accepts a string and a 
# key-sequence as args, returning the encrypted message. Assume that the message 
# consists of only lowercase alphabetic characters.

def vigenere_cipher(message, keys)
  alpha = ('a'..'z').to_a
  message.each_char.with_index do |c, i|
    message[i] = alpha[(alpha.index(c) + keys[i % keys.size]) % alpha.size]
  end
  message
end
# vowel_rotate
# Write a method vowel_rotate(str) that accepts a string as an arg and returns 
# the string where every vowel is replaced with the vowel the appears before it 
# sequentially in the original string. The first vowel of the string should be 
# replaced with the last vowel.

def vowel_rotate(str)
  vowels = 'aeiou'
  vowels_in_str = str.split('').select { |c| vowels.include?(c) }.rotate(-1)
  str.split('').map { |c| vowels.include?(c) ? vowels_in_str.shift : c }.join
end

class String
  def select(&prc)
    return '' unless prc

    split('').map { |el| prc.call(el) ? el : '' }.join
  end

  def map!(&prc)
    split('').each_index do |i|
      self[i] = prc.call(self[i])
    end
  end
end

def multiply(num1, num2)
  return 0 if num2.zero?

  num1 + multiply(num1, num2 - 1)
end

def lucas_sequence(num)
  return [] if num.zero?
  return [2] if num == 1
  return [2, 1] if num == 2

  seq = lucas_sequence(num - 1)
  next_n = seq[-1] + seq[-2]
  seq << next_n
end

def prime_factorization(num)
  (2..Math.sqrt(num)).each do |fact|
    next unless (num % fact).zero?

    return [*prime_factorization(fact), *prime_factorization(num / fact)]
  end
  [num]
end

