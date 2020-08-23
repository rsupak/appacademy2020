def zip(*args)
  size = args.first.size

  (0...size).map do |i|
    args.map { |arg| arg[i] }
  end
end

def prizz_proc(arr, prc1, prc2)
  arr.select do |el|
    (prc1.call(el) && !prc2.call(el)) || (!prc1.call(el) && prc2.call(el))
  end
end

def zany_zip(*args)
  size = args.map(&:size).max

  (0...size).map { |i| args.map { |arg| arg[i] } }
end

def maximum(arr, &prc)
  return if arr.empty?

  max = arr.first
  arr.each do |el|
    max = el if prc.call(el) >= prc.call(max)
  end
  max
end

def my_group_by(arr, &prc)
  hash = Hash.new { |h, k| h[k] = [] }
  arr.each { |el| hash[prc.call(el)] << el }
  hash
end

def max_tie_breaker(arr, tie, &prc)
  return if arr.empty?

  max = arr.first
  arr.each do |el|
    result_max = prc.call(max)
    result_el = prc.call(el)
    if result_el > result_max
      max = el
    elsif result_el == result_max && tie.call(el) > tie.call(max)
      max = el
    end
  end
  max
end

def silly_syllables(str)
  vowels = 'aeiou'
  str.split.map do |word|
    word = word.chars
    if word.count { |c| vowels.include?(c) } >= 2
      word.shift until vowels.include?(word.first)
      word.pop until vowels.include?(word.last)
    else
      word
    end
    word.join
  end.join(' ')
end
