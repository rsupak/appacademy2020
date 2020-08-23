# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  facts_num1 = (2..num_1).select { |n| (num_1 % n).zero? }
  gcf = facts_num1.select { |n| (num_2 % n).zero? }.max
  num_1 / gcf * num_2
end


# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
  bg_hash = Hash.new(0)
  (0...str.size - 1).each do |i|
    bg_hash[str[i] + str[i + 1]] += 1
  end
  bg_hash.max_by { |_, v| v }.first
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
      inverse_hash = {}
      each { |k, v| inverse_hash[v] = k }
      inverse_hash
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
      count = 0
      (0...size).each do |i|
        (i...size).each do |j|
          count += 1 if i != j && self[i] + self[j] == num
        end
      end
      count
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
      prc ||= proc { |a, b| a <=> b }
      (1...size).each do |i|
        next if prc.call(self[i - 1], self[i]).negative?

        self[i - 1], self[i] = self[i], self[i - 1]
        self.bubble_sort(&prc)
      end
      self
    end
end
