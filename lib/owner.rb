class Owner
  attr_accessor :name, :pets
  attr_reader :species
  OWNERS = []

  def initialize(species="human")
    @species = species
    OWNERS << self
    @pets = { :fishes => [], :dogs => [], :cats => [] }
  end

  def self.all
    OWNERS
  end

  def self.count
    OWNERS.count
  end

  def self.reset_all
    OWNERS.clear
  end

  def say_species
    if self.species.match(/\b[AEIOUaeiou]/)
      "I am an #{self.species}."
    else
      "I am a #{self.species}."
    end
  end

  def buy_fish(name)
    fish = Fish.new(name)
    self.pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    self.pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    self.pets[:dogs] << dog
  end

  def walk_dogs
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.each do |type, pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
      pets.clear
    end
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end
end
