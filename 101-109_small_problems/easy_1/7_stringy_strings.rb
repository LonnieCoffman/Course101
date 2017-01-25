# initial solution
def stringy(count)
  string = ''
  count.times { |n| string << (n.even? ? '1' : '0') }
  string
end

# modified solution after reading discussion
def stringy_1(count, start=1)
  string = ''
  if start == 1
    count.times { |n| string << (n.even? ? '1' : '0') }
  else
    count.times { |n| string << (n.odd? ? '1' : '0') }
  end
  string
end

puts stringy_1(6)
puts stringy_1(6, 0)

# test cases should all evaluate to true
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'
