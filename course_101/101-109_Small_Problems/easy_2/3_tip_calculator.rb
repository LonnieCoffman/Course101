def calculate_tip(total, percentage)
  tip = (total * (percentage * 0.01)).round(2)
  total = (total + tip).round(2)
  puts "The tip is #{format('$%.2f', tip)}"
  puts "The total is #{'$%.2f' % total}"
end

print 'What is the bill amount?: '
bill = gets.chomp.to_f
print 'What percentage would you like to tip?: '
percent = gets.chomp.to_f

calculate_tip(bill, percent)
