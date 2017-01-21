class MyCar

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  attr_accessor :current_speed

  def speed_up(num)
    self.current_speed += num
  end

  def brake(num)
    self.current_speed -= num
  end

  def shut_off
    self.current_speed = 0
  end
end

car = MyCar.new(2016, 'Tacoma', 'Orange')
p car.current_speed
car.speed_up(65)
p car.current_speed
car.brake(30)
p car.current_speed
car.shut_off
p car.current_speed
