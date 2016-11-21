def staggered_case(str, only_alpha = true)
  count = 0
  new_str = ''
  str.each_char do |letter|
    new_str += count.even? ? letter.upcase : letter.downcase
    count += 1 if !only_alpha || (only_alpha && letter =~ /\p{Alpha}/)
  end
  new_str
end

puts staggered_case('I Love Launch School!', false) #== 'I lOvE lAuNcH sChOoL!'
puts staggered_case('ALL CAPS') == 'AlL cApS'
puts staggered_case('ignore 77 the 444 numbers', false) #== 'IgNoRe 77 ThE 444 nUmBeRs'
