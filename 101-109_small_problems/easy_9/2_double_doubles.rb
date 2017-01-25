def twice(int)
  half = int.to_s.size == 1 ? 1 : int.to_s.size / 2
  full = int.to_s.size
  return int if int.to_s[0..half - 1] == int.to_s[half..full + 1]
  int * 2
end

puts twice(37) == 74
puts twice(44) == 44
puts twice(334433) == 668866
puts twice(444) == 888
puts twice(107) == 214
puts twice(103103) == 103103
puts twice(3333) == 3333
puts twice(7676) == 7676
puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
puts twice(5) == 10
