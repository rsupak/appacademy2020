def element_count(array)
  hash = Hash.new(0)
  array.each { |el| hash[el] += 1 }
  hash
end

def char_replace!(str, hash)
  str.each_char.with_index do |c, i|
    str[i] = hash[c] if hash[c]
  end
  str
end

def product_inject(arr)
  arr.inject(&:*)
end
