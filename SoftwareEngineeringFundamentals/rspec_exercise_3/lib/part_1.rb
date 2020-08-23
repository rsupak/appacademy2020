def is_prime?(num)
  return false if num < 2

  count = 0
  (2..Math.sqrt(num)).each { |n| count += 1 if (num % n).zero? }
  count.zero?
end

def nth_prime(num)
  count = 1
  start = 2
  until count == num
    start += 1
    count += 1 if is_prime?(start)
  end
  start
end

def prime_range(min, max)
  primes = []
  (min..max).each { |fact| primes << fact if is_prime?(fact) }
  primes
end
