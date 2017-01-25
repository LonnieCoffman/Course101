LETTER = { A: 90, B: 80, C: 70, D: 60 }.freeze

def get_grade(*grades)
  avg = (grades.inject(:+) / grades.size / 10).floor * 10
  avg = 90 if avg > 99
  (LETTER.key(avg) || 'F').to_s
end

puts get_grade(100, 100, 100) == "A"
puts get_grade(50, 50, 95) == "D"
puts get_grade(45, 67, 32) == "F"
