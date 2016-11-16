def triangle(num)
  (0..num).each { |x| puts ('*' * x).rjust(num, ' ') }
end

# 5,0
# 4,1
# 3,2
# 2,3
# 1,4
# 0,5

triangle(5)
triangle(9)
