class Viking
  attr_reader :dead, :name
  def initialize(name, health, age, strength)
    @name = name
    @health = health
    @age = age
    @strength = strength
    @dead = false
  end

  def self.create_warrior(name)
    age = (rand * 20 + 15).round(0)
    health = [age * 5, 120].min
    strength = [age / 2, 10].min
    Viking.new(name, health, age, strength)
  end

  def self.random_name
    ['Erik', 'Lars', 'Gustav', 'Leif', 'Floki', 'Bjorn', 'Ragnar'].sample
  end

  def attack(other_viking)
    if other_viking.dead
      puts "#{other_viking.name} is already dead"
      return false
    end
    damage = (rand * 10 + 10).round(0)
    other_viking.take_damage(damage)
  end

  def to_s
    "#{{'name' => @name,
     'health' => @health,
     'age' => @age,
     'strength' => @strength}}"
  end

  protected
    def take_damage(damage)
      @health -= damage
      puts "Ouch!!, #{self.name} has taken #{damage} of damage now has #{@health} health left"
      die if @health <= 0
    end
  
  private
    attr_writer :dead, :health

    def die
      puts "#{self.name} has been killed :("
      self.dead = true
    end

end

warrior1 = Viking.create_warrior(Viking.random_name)
warrior2 = Viking.create_warrior(Viking.random_name)

10.times {warrior1.attack(warrior2)}
