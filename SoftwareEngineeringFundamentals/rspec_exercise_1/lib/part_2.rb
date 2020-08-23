def hipsterfy(str)
  raise 'arg must be a String' unless str.is_a?(String)

  (str.size - 1).downto(0) do |i|
    return str[0...i] + str[i + 1..-1] if 'aeiou'.include?(str[i])
  end
  str
end

def vowel_counts(str)
  str = str.downcase
  str.split('')
     .select { |c| 'aeiou'.include?(c) }
     .map! { |el| [el, str.count(el)] }
     .to_h
end

def caesar_cipher(str, num)
  unless str.is_a?(String) && num.is_a?(Numeric)
    raise 'arg[0] must be type String, arg[1] must be type Number'
  end

  lower_case_range = ('a'.ord..'z'.ord)
  upper_case_range = ('A'.ord..'Z'.ord)
  num = num % 26
  str.each_char.with_index do |c, i|
    if lower_case_range.include?(c.ord) || upper_case_range.include?(c.ord)
      if c == c.downcase && c.ord + num - 'z'.ord <= 0
        str[i] = (c.ord + num).chr
      elsif c == c.downcase && (c.ord + num - 'z'.ord).positive?
        str[i] = ('a'.ord - 1 + c.ord + num - 'z'.ord).chr
      elsif c == c.upcase && c.ord + num - 'Z'.ord <= 0
        str[i] = (c.ord + num).chr
      elsif c == c.upcase && (c.ord + num - 'Z'.ord).positive?
        str[i] = ('A'.ord - 1 + c.ord + num - 'Z'.ord).chr
      end
    end
  end
  str
end
