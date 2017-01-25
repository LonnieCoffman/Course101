def xor?(arg1, arg2)
  return true if (arg1 && !arg2) || (!arg1 && arg2)
  false
end

puts xor?(5.even?, 4.even?) == true
puts xor?(5.odd?, 4.odd?) == true
puts xor?(5.odd?, 4.even?) == false
puts xor?(5.even?, 4.odd?) == false

# after reading solution the following is a much better solution since the true
# and false are redundant.
#
# def xor?(arg1, arg2)
#   (arg1 && !arg2) || (!arg1 && arg2)
# end
