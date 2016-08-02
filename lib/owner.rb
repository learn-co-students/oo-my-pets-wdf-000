class Owner
  # code goes here
  attr_accessor :pets, :name
  attr_reader :species

  @@all = []


  def initialize(name)
  	@pets = {fishes: [], cats: [], dogs: []}
  	@@all << self
  	@species = "human"
  end

  def self.all
  	@@all
  end

  def self.reset_all
  	@@all.clear
  end

  def self.count
  	@@all.length
  end

  def say_species
  	"I am a #{@species}."
  end

  def buy_fish(petname)
  	fish = Fish.new(petname)
  	@pets[:fishes] << fish
  end

  def buy_cat(petname)
  	cat = Cat.new(petname)
  	@pets[:cats] << cat
  end

  def buy_dog(petname)
  	dog = Dog.new(petname)
  	@pets[:dogs] << dog
  end

  def walk_dogs
  	@pets[:dogs].map do |dog|
  		dog.mood = "happy"
  	end
  end

  def play_with_cats
  	@pets[:cats].map do |cat|
  		cat.mood = "happy"
  	end
  end

  def feed_fish
  	@pets[:fishes].map do |fish|
  		fish.mood = "happy"
  	end
  end

  def sell_pets
  	@pets.each do |type, pets|
  		pets.map do |pet|
  			pet.mood = "nervous"
  		end
  		pets.clear
  	end
  end

  def list_pets
  	num_fish = @pets[:fishes].length
  	num_dogs = @pets[:dogs].length
  	num_cats = @pets[:cats].length
  	"I have #{num_fish} fish, #{num_dogs} dog(s), and #{num_cats} cat(s)."
  end

end