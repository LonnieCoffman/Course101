module Offroadable
  def ground_clearance(stock_height, tire_oversize, lift)
    stock_height + tire_oversize + lift
  end
end

class Vehicle
  @@object_count = 0

  attr_accessor :current_speed, :color
  attr_reader :year, :model

  def self.calculate_mileage(gallons, mileage)
    "#{mileage / gallons} MPG"
  end

  def self.total_objects
    "#{@@object_count} vehicle objects created"
  end

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
    @@object_count += 1
  end

  def to_s
    "My car is a #{color} #{year} #{model}"
  end

  def speed_up(num)
    self.current_speed += num
  end

  def brake(num)
    self.current_speed -= num
  end

  def shut_off
    self.current_speed = 0
  end

  def spray_paint(color)
    self.color = color
    puts "Your car just got out of the paint shop and is now a beautiful #{color} color!"
  end

end

class MyCar < Vehicle
  HAS_BED = false
end

class MyTruck < Vehicle
  include Offroadable
  HAS_BED = true
end

truck = MyTruck.new(2016, 'Tacoma', 'Orange')
puts truck.ground_clearance(12, 4, 6)
