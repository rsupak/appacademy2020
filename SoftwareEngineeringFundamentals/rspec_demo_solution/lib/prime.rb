def prime?(num)
  return false if num < 2

  (2..Math.sqrt(num)).each do |n|
    return false if (num % n).zero?
  end
  true
end
