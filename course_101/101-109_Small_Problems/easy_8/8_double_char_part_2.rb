def double_consonants(str)
  str.chars.map { |char| char =~ /[b-df-hj-np-tv-z]/i ? char * 2 : char }.join
end

puts double_consonants('String') == "SSttrrinngg"
puts double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
puts double_consonants("July 4th") == "JJullyy 4tthh"
puts double_consonants('') == ""
