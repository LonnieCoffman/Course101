class Person
  attr_accessor :first_name, :last_name

  def initialize(name)
    @first_name = name.split[0]
    @last_name = name.split[1] || ''
  end

  def name=(name)
    self.first_name = name.split[0]
    self.last_name = name.split[1] || ''
  end

  def name
    last_name.empty? ? first_name : "#{first_name} #{last_name}"
  end

  def name_same?(other_person)
    compare_name(other_person)
  end

  protected

  def compare_name(other_person)
    name == other_person.name
  end

end

bob = Person.new('Robert Smith')
rob = Person.new('Robert Smith')
p bob.name_same?(rob)

p bob.name == rob.name
