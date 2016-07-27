require 'pry'

class Owner
  attr_accessor :pets, :name
  attr_reader :species
    @@owner = []

  def initialize(species)
    @species = species
      @pets = {fishes: [], cats: [], dogs: []}
        @@owner << self
  end

  def self.all
    @@owner
  end

  def self.count
    @@owner.count

  end

  def self.reset_all
    all.clear
  end

  def say_species
     "I am a #{species}."
  end

  def buy_fish(fish)
    new_object = Fish.new(fish)
      @pets[:fishes] << new_object
        @pets[:fishes].count
  end

  def buy_cat(new_cat)
    new_object = Cat.new(new_cat)
      @pets[:cats] << new_object
        @pets[:cats].count
  end

  def buy_dog(new_dog)
    new_object = Dog.new(new_dog)
      @pets[:dogs] << new_object
        @pets[:dogs].count
  end

  def walk_dogs
    @pets[:dogs].each do |value|   #value is an object. Remember!!
      value.mood = "happy"
        return @pets
    end
  end

  def play_with_cats
    @pets[:cats].each do |value|
      value.mood = "happy"
        return @pets
    end
  end

  def feed_fish
    @pets[:fishes].each do |value|
      value.mood = "happy"
        return @pets
    end
  end

  def sell_pets
    @pets.each do |type, pets|
      pets.each do |val|
        val.mood = "nervous"
           @pets
      end
        pets.clear
    end
  end


  def list_pets
    pet_one = @pets[:fishes].count
      pet_two = @pets[:cats].count
        pet_three = @pets[:dogs].count
          val = "I have #{pet_one} fish, #{pet_three} dog(s), and #{pet_two} cat(s)."
    return val
  end


end
