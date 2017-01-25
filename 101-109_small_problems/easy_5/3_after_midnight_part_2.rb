MINS_IN_HOUR = 60
MINS_IN_DAY = 1440

def before_midnight(time)
  hours, minutes = time.split(':')
  ((hours.to_i * MINS_IN_HOUR + minutes.to_i) % -MINS_IN_DAY).abs
end

def after_midnight(time)
  hours, minutes = time.split(':')
  (hours.to_i * MINS_IN_HOUR + minutes.to_i) % MINS_IN_DAY
end

puts after_midnight('00:00') == 0
puts before_midnight('00:00') == 0
puts after_midnight('12:34') == 754
puts before_midnight('12:34') == 686
puts after_midnight('24:00') == 0
puts before_midnight('24:00') == 0
