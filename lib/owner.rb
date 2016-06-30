require 'pry'
class Owner
	@@owners = []
	attr_accessor :name, :pets
	attr_reader :species
  # code goes here

  def initialize(species)
  	@species = species
  	@pets = {:fishes => [], :dogs => [], :cats => []}
  	save
  end

  def owners
  	@owners
  end

  def save
  	@@owners << self
  end

  def self.all
  	@@owners
  end
  	
  def self.reset_all
  	@@owners.clear
  end

  def self.count
  	@@owners.size
  end

  def species
  	@species
  end

  def say_species
  	"I am a #{self.species}."
  end

  def pets
  	@pets
  end

  def buy_fish(fish_name)
  	fish = Fish.new(fish_name)
  	pets[:fishes] << fish
  end

  def buy_cat(cat_name)
  	cat = Cat.new(cat_name)
  	pets[:cats] <<	cat
  end

  def buy_dog(dog_name)
  	dog =	Dog.new(dog_name)
  	pets[:dogs] <<	dog
  end

  def walk_dogs
  	self.pets[:dogs].each {|dog| dog.mood = "happy"}
  end

  def play_with_cats
  	self.pets[:cats].each {|cat| cat.mood = "happy"}
  end

  def feed_fish
  	self.pets[:fishes].each {|fish| fish.mood = "happy"}  	
  end

  def sell_pets
  	self.pets.each do |type, type_pets|
  		type_pets.each do |pet|
  			# binding.pry
  			pet.mood = "nervous" if pet.mood == nil || pet.mood != "nervous"
  			# binding.pry
  		end
  	end
  	self.pets.clear
  end

  def list_pets
  	dog_n = self.pets[:dogs].size
  	cat_n = self.pets[:cats].size
  	fish_n = self.pets[:fishes].size
  	"I have #{fish_n} fish, #{dog_n} dog(s), and #{cat_n} cat(s)."
  end

end