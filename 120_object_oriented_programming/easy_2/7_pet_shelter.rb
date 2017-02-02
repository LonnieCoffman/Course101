# Pet class
# instance variables: pet, pet_name
#
# Owner class
# instance varaibles: name, number_of_pets
# method: to_s
#
# Shelter class
# method: adopt
# -- owner_name, pet_name
# method: print_adoptions

class Shelter
  attr_reader :owners

  def initialize
    @owners = []
  end

  def adopt(owner, pet)
    owner.number_of_pets += 1
    owner.adopted_pets << [pet.type, pet.name]
    owners << owner unless owners.include? owner
  end

  def print_adoptions
    owners.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      owner.adopted_pets.each do |pet|
        puts "a #{pet[0]} named #{pet[1]}"
      end
      puts
    end
  end
end

class Pet
  attr_reader :name, :type

  def initialize(type, name)
    @type = type
    @name = name
  end
end

class Owner
  attr_accessor :number_of_pets, :adopted_pets
  attr_reader :name

  def initialize(name)
    @adopted_pets = []
    @number_of_pets = 0
    @name = name
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
