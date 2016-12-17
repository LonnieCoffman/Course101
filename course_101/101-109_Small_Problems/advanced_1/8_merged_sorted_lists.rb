def bubble_sort(arr)
  loop do
    change = false
    (0..arr.size - 2).each do |idx|
      if arr[idx] > arr[idx + 1]
        arr[idx], arr[idx + 1] = arr[idx + 1], arr[idx]
        change = true
      end
    end
    break if change == false
  end
  arr
end

def merge(arr1, arr2)
  new_arr = []
  new_arr << arr1 << arr2
  new_arr.flatten!
  bubble_sort(new_arr)
end

p merge([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge([], [1, 4, 5]) == [1, 4, 5]
p merge([1, 4, 5], []) == [1, 4, 5]
