require 'byebug'

def is_prime?(num)
  (2..Math.sqrt(num)).each do |fact|
    return false if (num % fact).zero?
  end

  num > 1
end

def first_n_primes(num_primes)
  primes = []
  num = 2
  debugger
  while primes.length < num_primes
    primes << num if is_prime?(num)
    num += 1
  end
  primes
end

p first_n_primes(11)
