def suffix(num)
  return 'th' if num >= 10 && num <= 20
  nth = %w(th st nd rd th th th th th th th)
  nth[num % 10]
end

def century(year)
  cent = ((year.to_i - 1) / 100 + 1).to_s
  ending = (cent[-2..-1] || cent).to_i
  "#{cent}#{suffix(ending)}"
end

puts century(2000) == '20th'
puts century(2001) == '21st'
puts century(1965) == '20th'
puts century(256) == '3rd'
puts century(5) == '1st'
puts century(10103) == '102nd'
puts century(1052) == '11th'
puts century(1127) == '12th'
puts century(11201) == '113th'
