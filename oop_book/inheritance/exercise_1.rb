class Vehicle
  def self.calculate_mileage(gallons, mileage)
    "#{mileage / gallons} MPG"
  end

  attr_accessor :current_speed, :color
  attr_reader :year, :model

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
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
  HAS_BED = true
end

truck = MyTruck.new(2016, 'Tacoma', 'Orange')
puts truck
car = MyCar.new(2017, 'Tercel', 'Red')
puts car
