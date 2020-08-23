def strange_sums(arr)
  count = 0
  (0...arr.size).each do |i|
    (i...arr.size).each do |j|
      count += 1 if (arr[i] + arr[j]).zero?
    end
  end
  count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product(arr, product)
  (0...arr.size).each do |i|
    (i + 1...arr.size).each do |j|
      return true if arr[i] * arr[j] == product
    end
  end
  false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats(str, hash)
  str.chars.map { |c| hash.key?(c) ? c * hash[c] : c }.join
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
  (1..num).any? { |n| n.pow(2) == num }
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def anti_prime?(num)
  num_facts = count_facts(num)
  (1...num).all? { |i| num_facts > count_facts(i) }
end

def count_facts(num)
  (1..num).select { |n| (num % n).zero? }.size
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(matrix1, matrix2)
  new_matrix = Array.new(matrix1.size) { [] }

  matrix1.each_index do |i|
    matrix1[i].each_index do |j|
      new_matrix[i] << matrix1[i][j] + matrix2[i][j]
    end
  end
  new_matrix
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def factor(num)
  (1..num).select { |f| (num % f).zero? }
end

def mutual_factors(*nums)
  nums.map { |num| factor(num) }.inject(:&)
end

# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number(n)
  return 0 if n.zero?
  return 1 if n <= 2
  return 2 if n == 3

  tribonacci_number(n - 3) + tribonacci_number(n - 2) + tribonacci_number(n - 1)
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

def matrix_addition_reloaded(*matrices)
  size = matrices.first.size
  return if matrices.any? { |m| m.size != size }

  new_matrix = matrices[0].dup
  matrices[1..-1].each do |mat2|
    new_matrix = matrix_addition(new_matrix, mat2)
  end
  new_matrix
end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

def squarocol?(matrix)
  return true if matrix.any? { |row| row.uniq.size == 1}

  return true if matrix.transpose.any? { |row| row.uniq.size == 1 }

  false
end

p squarocol?([
  [:a, :x , :d],
  [:b, :x , :e],
  [:c, :x , :f],
]) # true

p squarocol?([
  [:x, :y, :x],
  [:x, :z, :x],
  [:o, :o, :o],
]) # true

# p squarocol?([
#   [:o, :x , :o],
#   [:x, :o , :x],
#   [:o, :x , :o],
# ]) # false

# p squarocol?([
#   [1, 2, 2, 7],
#   [1, 6, 6, 7],
#   [0, 5, 2, 7],
#   [4, 2, 9, 7],
# ]) # true

# p squarocol?([
#   [1, 2, 2, 7],
#   [1, 6, 6, 0],
#   [0, 5, 2, 7],
#   [4, 2, 9, 7],
# ]) # false

def squaragonal?(matrix)
  key1 = matrix[0][0]
  key2 = matrix[0][matrix.size - 1]
  test_dr = true
  test_dl = true

  (0...matrix.size).each do |i|
    test_dr = false unless matrix[i][i] == key1
  end

  j = matrix.size - 1
  (0...matrix.size).each do |i|
    test_dl = false unless matrix[i][j] == key2
    j -= 1
  end

  test_dr || test_dl
end

# p squaragonal?([
#   [:x, :y, :o],
#   [:x, :x, :x],
#   [:o, :o, :x],
# ]) # true

# p squaragonal?([
#   [:x, :y, :o],
#   [:x, :o, :x],
#   [:o, :o, :x],
# ]) # true

# p squaragonal?([
#   [1, 2, 2, 7],
#   [1, 1, 6, 7],
#   [0, 5, 1, 7],
#   [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#   [1, 2, 2, 5],
#   [1, 6, 5, 0],
#   [0, 2, 2, 7],
#   [5, 2, 9, 7],
# ]) # false

def pascals_triangle(n)
  triangle = []
  (1..n).each do |line|
    level = []
    num = 1
    (1..line).each do |idx|
      level << num
      num = (num * (line - idx) / idx)
    end
    triangle << level
  end
  triangle
end

# p pascals_triangle(5)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1]
# # ]

# p pascals_triangle(7)
# # [
# #     [1],
# #     [1, 1],
# #     [1, 2, 1],
# #     [1, 3, 3, 1],
# #     [1, 4, 6, 4, 1],
# #     [1, 5, 10, 10, 5, 1],
# #     [1, 6, 15, 20, 15, 6, 1]
# # ]

def mersenne_prime(n)
  count = 0
  i = 2
  mersenne = nil
  while count < n
    count += 1 if prime?(i) && prime?((2**i) - 1)
    mersenne = 2**i - 1
    i += 1
  end
  mersenne
end

def prime?(num)
  return false if num < 2
  
  count = 0
  (2..Math.sqrt(num)).each { |n| count += 1 if (num % n).zero? }
  count.zero?
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def triangular_word?(str)
  alpha = ('a'..'z').to_a
  str_sum = str.split('').map! { |c| alpha.index(c) + 1 }.sum
  tri_nums = []
  i = 1
  until (tri_nums.last || 0) >= str_sum
    tri_nums << i * (i + 1) / 2
    i += 1
  end
  tri_nums.include?(str_sum)
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(arr)
  (0...arr.size - 1).each do |i|
    j = i + 1
    next unless (arr[i] - arr[j]).abs == 1

    front = i.zero? ? [] : arr[0...i]
    rear = j == arr.size - 1 ? [] : arr[(j + 1)...arr.size]
    return consecutive_collapse(front + rear)
  end
  arr
end

# p consecutive_collapse([3, 4, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])              # []

def pretentious_primes(arr, n)
  arr.map { |num| replace_with_prime(num, n) }
end

def replace_with_prime(num, idx)
  primes = []
  if idx.negative?
    (num - 1).downto(2) do |i|
      primes << i if prime?(i)
    end
    primes += [nil] until primes.size >= idx.abs
  else
    i = num
    while primes.size < idx.abs
      i += 1
      primes << i if prime?(i)
    end
  end
  primes[idx.abs - 1]
end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]
