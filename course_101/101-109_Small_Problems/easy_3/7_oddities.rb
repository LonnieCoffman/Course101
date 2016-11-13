def oddities1(array)
  new_array = []
  array.each_with_index { |val, idx| new_array << val if idx.even? }
  new_array
end

def oddities(array)
  array.select.each_with_index { |_, idx| idx.even? }
end

puts oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
puts oddities(['abc', 'def']) == ['abc']
puts oddities([123]) == [123]
puts oddities([]) == []
