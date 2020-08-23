def all_words_capitalized?(arr)
  arr.all? { |el| el == el.capitalize }
end

def no_valid_url?(arr)
  valid_domains = %w(io com org net)
  arr.none? { |x| valid_domains.include?(x.split('.').last) }
end

def any_passing_students?(arr)
  arr.any? { |s| s[:grades].sum / s[:grades].size >= 75 }
end
