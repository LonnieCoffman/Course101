class MyCar

  def initialize(year, model, color)
    @year = year
    @model = model
    @color = color
    @current_speed = 0
  end

  attr_accessor :current_speed, :color
  attr_reader :year

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

car = MyCar.new(2016, 'Toyota', 'Orange')
p car.color
car.color = 'Red'
p car.color
p car.year
