def include?(arr, val)
  arr.each { |x| return true if x == val }
  false
end

puts include?([1,2,3,4,5], 3)
puts include?([1,2,3,4,5], 6)
puts include?([], 3)
puts include?([nil], nil)
puts include?([], nil)
