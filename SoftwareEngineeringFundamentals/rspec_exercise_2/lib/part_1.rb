def partition(arr, num)
  [arr.select { |el| el < num }, arr.select { |el| el >= num }]
end

def merge(hash1, hash2)
  dupe = hash1.dup
  hash2.each { |k, v| dupe[k] = v }
  dupe
end

def censor(sentence, curses)
  sentence.split.each do |word|
    next unless curses.include?(word.downcase)

    word.each_char.with_index do |c, i|
      word[i] = '*' if 'aeiou'.include?(c.downcase)
    end
  end.join(' ')
end

def power_of_two?(num)
  while num
    return true if num == 1
    return false if (num & 1) == 1

    num >>= 1
  end
  false
end
