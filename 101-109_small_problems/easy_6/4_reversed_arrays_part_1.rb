def reverse!(array)
  left_index = 0
  right_index = -1

  while left_index < array.size / 2
    array[left_index], array[right_index] = array[right_index], array[left_index]
    left_index += 1
    right_index -= 1
  end

  array
end


list = [1,2,3,4]
result = reverse!(list) # => [4,3,2,1]
p result
p list
p list.object_id == result.object_id

list = %w(a b c d e)
p reverse!(list) # => ["e", "d", "c", "b", "a"]
p list == ["e", "d", "c", "b", "a"]

list = ['abc']
p reverse!(list) # => ["abc"]
p list == ["abc"]

list = []
p reverse!([]) # => []
p list == []
