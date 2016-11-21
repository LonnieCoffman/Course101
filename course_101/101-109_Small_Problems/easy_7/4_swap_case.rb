def swapcase(str)
  str.chars.map do |char|
    char =~ /\p{Lower}/ ? char.upcase : char.downcase
  end.join
end
# def swapcase(string)
#   string.chars.map {|c| c.match(/[[:upper:]]/) ? c.downcase : c.upcase }.join
# end
puts swapcase('CamelCase') == 'cAMELcASE'
puts swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
