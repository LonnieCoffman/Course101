# Namespace module: Transportation
# -- Class: Vehicle
# -- Class: Truck < Vehicle
# -- Class: Car < Vehicle

module Transportation
  class Vehicle
  end

  class Truck < Vehicle
  end

  class Car < Vehicle
  end
end

car = Transportation::Car.new
p car.class
