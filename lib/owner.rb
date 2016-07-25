require 'pry'
class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []

  def initialize(species)
    @species = species
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end

  def self.count
    @@all.size
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name_of_fish)
    f_obj = Fish.new(name_of_fish)
    pets[:fishes] << f_obj
  end

  def buy_cat(name_of_cat)
    c_obj = Cat.new(name_of_cat)
    pets[:cats] << c_obj
  end

  def buy_dog(name_of_dog)
    d_obj = Dog.new(name_of_dog)
    pets[:dogs] << d_obj
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
    self.pets.each do |animal, array|
      array.each do |obj|
        obj.mood = "nervous"
      end
      array.clear
    end
  end

  def list_pets
    num_of_fish = self.pets[:fishes].size
    num_of_cats = self.pets[:cats].size
    num_of_dogs = self.pets[:dogs].size
    "I have #{num_of_fish} fish, #{num_of_dogs} dog(s), and #{num_of_cats} cat(s)."
  end

end