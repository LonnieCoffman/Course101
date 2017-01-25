def interleave1(arr1, arr2)
  new_array = []
  arr1.each_index { |idx| new_array.concat([arr1[idx], arr2[idx]]) }
  new_array
end

def interleave(arr1, arr2)
  arr1.zip(arr2).flatten
end

puts interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c'] # here is a test