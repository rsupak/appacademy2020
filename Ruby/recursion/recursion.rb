def sum_to(num)
  return if num.negative?
  num.zero? ? 0 : num + sum_to(num - 1)
end

def add_numbers(arr)
  return arr.first if arr.empty? || arr.size == 1
  arr.first + add_numbers(arr[1..-1])
end

def gamma(num)
  return if num < 1
  return 1 if num == 1
  (num - 1) * gamma(num - 1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty?
  return true if flavors.first == favorite

  ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(str)
  return str if str.size.zero?

  str[-1] + reverse(str[0...-1])
end

p reverse('hello')
