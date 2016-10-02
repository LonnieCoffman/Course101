def conditional_caps(string)
  return string.upcase if string.length > 10
  string
end

puts conditional_caps('short')
puts conditional_caps('a lot longer')
