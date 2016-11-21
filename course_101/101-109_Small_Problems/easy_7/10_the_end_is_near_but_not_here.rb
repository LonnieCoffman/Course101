def penultimate(str)
  size = str.split.size
  str.split.slice(-size / 2)
end

puts penultimate('last word') #== 'last'
puts penultimate('Launch School is great and here is the reason! whi') #== 'is'
