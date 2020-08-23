def average(num1, num2)
  raise 'args must be numbers' if !num1.is_a?(Numeric) || !num2.is_a?(Numeric)

  (num1 + num2) / 2.0
end

def average_array(arr)
  raise 'arg must be number array' if arr.any? { |el| !el.is_a?(Numeric) }

  arr.sum / arr.size.to_f
end

def repeat(str, num)
  unless str.is_a?(String) && num.is_a?(Numeric)
    raise 'arg[0] must be type String, arg[1] must be type Number'
  end

  str * num
end

def yell(str)
  raise 'arg must be a String' unless str.is_a?(String)

  "#{str.upcase}!"
end

def alternating_case(str)
  raise 'arg must be a String' unless str.is_a?(String)

  str.split.map.with_index { |w, i| i.even? ? w.upcase : w.downcase }.join(' ')
end
