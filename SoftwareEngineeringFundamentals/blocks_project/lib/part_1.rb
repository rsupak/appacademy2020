def select_even_nums(arr)
  arr.select(&:even?)
end

def reject_puppies(arr)
  arr.reject { |el| el['age'] <= 2 }
end

def count_positive_subarrays(arr)
  arr.count { |x| x.sum.positive? }
end

def aba_translate(str)
  new_str = ''
  str.each_char do |c|
    new_str += 'aeiou'.include?(c.downcase) ? c + 'b' + c : c
  end
  new_str
end

def aba_array(arr)
  translate = proc { |word| aba_translate(word) }
  arr.map(&translate)
end
