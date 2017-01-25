def triangle(s1, s2, s3)
  tri = [s1, s2, s3].sort
  return :invalid if tri[0] + tri[1] <= tri[2] || tri.include?(0)
  sides = tri.uniq.count
  case sides
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
