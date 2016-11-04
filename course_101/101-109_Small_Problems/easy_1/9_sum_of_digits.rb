# initial solution
def sum_1(num)
  total = 0
  num.to_s.chars{ |n| total += n.to_i }
  total
end

# modified solution after reading discusssion
def sum(num)
  num.to_s.chars.map(&:to_i).inject(:+)
end

# test cases should all evaluate to true
puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
