def staggered_case(str, first_upper = true)
  count = first_upper ? 0 : 1
  new_str = ''
  str.each_char do |letter|
    new_str += count.even? ? letter.upcase : letter.downcase
    count += 1
  end
  new_str
end

puts staggered_case('I Love Launch School!', false) #== 'I LoVe lAuNcH ScHoOl!'
puts staggered_case('ALL_CAPS') == 'AlL_CaPs'
puts staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
