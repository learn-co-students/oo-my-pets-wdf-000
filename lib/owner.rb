require 'pry'
class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def initialize(species)
    @species = species
    @pets = {fishes: [], cats: [], dogs: []}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.count
  end

  def say_species
    "I am a human."
  end

  def name=(name)
    @name = name
  end

  def buy_fish(name)
    fish = Fish.new(name)
    pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    pets[:dogs] << dog
  end

  def walk_dogs
    pets[:dogs].each {|dog| dog.mood = "happy" }
  end

  def play_with_cats
    pets[:cats].each {|cat| cat.mood = "happy" }
  end

  def feed_fish
    pets[:fishes].each {|fish| fish.mood = "happy" }
  end

  def sell_pets
    pets.each do |keys, values|
      values.each do |pet|
        pet.mood = "nervous"
        # binding.pry
      end
    end
    pets.clear
  end

  def list_pets
    fish = 0
    cats = 0
    dogs = 0
    pets.each do |key, values|
      case
      when key == :fishes
        fish = values.count
      when key == :cats
        cats = values.count
      when key == :dogs
        dogs = values.count
      end
    end
    # binding.pry
    "I have #{fish} fish, #{dogs} dog(s), and #{cats} cat(s)."
  end

end