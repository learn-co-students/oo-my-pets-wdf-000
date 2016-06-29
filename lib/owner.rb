require 'pry'

class Owner

attr_reader :species
attr_accessor :name, :pets

@@owners = []

def initialize(species)
  @species = species
  @@owners << self
  @pets = {:fishes => [], :dogs => [], :cats => []}
end

def self.all
  @@owners
end

def self.reset_all
  @@owners = []
end

def self.count
  self.all.size
end

def say_species
  "I am a #{self.species}."
end

def buy_fish(fish_name)
  fish = Fish.new(fish_name)
  self.pets[:fishes] << fish
end

def buy_cat(cat_name)
  cat = Cat.new(cat_name)
  self.pets[:cats] << cat
end

def buy_dog(dog_name)
  dog = Dog.new(dog_name)
  self.pets[:dogs] << dog
end

def walk_dogs
  self.pets[:dogs].map! {|dog| dog.mood = "happy"}
end

def play_with_cats
  self.pets[:cats].map! {|cat| cat.mood = "happy"}
end

def feed_fish
  self.pets[:fishes].map! {|fish| fish.mood = "happy"}
end

def sell_pets
  self.pets.collect do |pet_species, species_array|
    species_array.map! {|pet| pet.mood = "nervous"}
    self.pets[pet_species] = []
  end
end

def list_pets
  "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
end
end
