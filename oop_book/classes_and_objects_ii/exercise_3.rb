# initially there was an error because there was no setter method for the
# instance variable 'name'.  This can be fixed by changing attr_reader to
# attr_accessor

class Person
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

bob = Person.new("Steve")
bob.name = "Bob"
p bob.name
