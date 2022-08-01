class Viking
  def initialize(name, health, age, strength)
    @name = name
    @health = health
    @age = age
    @strength = strength
  end

  def self.create_warrior(name)
    age = rand * 20 + 15
    health = [age * 5, 120].min
    strength = [age / 2, 10].min
    Viking.new(name, health, age, strength)
  end

  def self.random_name
    ['Erik', 'Lars', 'Gustav', 'Leif', 'Floki', 'Bjorn', 'Ragnar'].sample
  end

  def to_s
    "#{{'name' => @name,
     'health' => @health,
     'age' => @age,
     'strength' => @strength}}"
  end
end

warrior1 = Viking.create_warrior(Viking.random_name)
puts warrior1
