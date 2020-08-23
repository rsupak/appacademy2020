def array_translate(array)
  string = ''
  words, numbers = array.partition { |obj| obj.is_a?(String) }
  words.each_index do |i|
    string << words[i] * numbers[i]
  end
  string
end

print array_translate(["Cat", 2, "Dog", 3, "Mouse", 1]); # => "CatCatDogDogDogMouse"
puts

print array_translate(["red", 3, "blue", 1]); # => "redredredblue"
puts
