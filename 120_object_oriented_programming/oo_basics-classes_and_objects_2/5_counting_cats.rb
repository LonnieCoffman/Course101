# Create class named Cat
# class variable that increments when object is created
# class method named total that prints instantiated count

class Cat
  @@object_count = 0

  def initialize
    @@object_count += 1
  end

  def self.total
    puts @@object_count
  end
end

kitty1 = Cat.new
kitty2 = Cat.new

Cat.total
