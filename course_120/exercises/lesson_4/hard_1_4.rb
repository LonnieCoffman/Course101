module Moveable
  attr_accessor :speed, :heading
  attr_writer :fuel_capacity, :fuel_efficiency

  def range
    @fuel_capacity * @fuel_efficiency
  end
end

class SeaVehicle
  include Moveable

  attr_accessor :propeller_count, :hull_count

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity, num_propellers, num_hulls)
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
    self.propeller_count = num_propellers
    self.hull_count = num_hulls
  end

  def range
    fueled_range = super
    fueled_range + 10
  end
end

class WheeledVehicle
  include Moveable

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end
end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30, 30, 32, 32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20, 20], 80, 8.0)
  end
end

class Catamaran < SeaVehicle
  def initialize
    super(45, 90, 2, 2)
  end
end

class Motorboat < SeaVehicle
  def initialize
    super(50, 100, 1, 1)
  end
end

car = Auto.new
bike = Motorcycle.new
sailboat = Catamaran.new
boat = Motorboat.new
