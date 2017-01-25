def triangle(s1, s2, s3)
  tri = [s1, s2, s3].sort
  return :invalid if tri.inject(:+) != 180 || s1 <= 0
  case
  when tri[2] > 90 then :obtuse
  when tri[2] < 90 then :acute
  else :right
  end
end

puts triangle(60, 70, 50) == :acute
puts triangle(30, 90, 60) == :right
puts triangle(120, 50, 10) == :obtuse
puts triangle(0, 90, 90) == :invalid
puts triangle(50, 50, 50) == :invalid
