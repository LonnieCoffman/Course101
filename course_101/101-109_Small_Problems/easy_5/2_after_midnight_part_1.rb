def time_of_day(minutes)
  hour = (minutes / 60) % 24
  minute = minutes % 60
  "#{hour.to_s.rjust(2, '0')}:#{minute.to_s.rjust(2, '0')}"
end

puts time_of_day(0) == "00:00"
puts time_of_day(-3) == "23:57"
puts time_of_day(35) == "00:35"
puts time_of_day(-1437) == "00:03"
puts time_of_day(3000) == "02:00"
puts time_of_day(800) == "13:20"
puts time_of_day(-4231) == "01:29"
