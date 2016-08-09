class Owner
  # code goes here

  	OWNERS = []
  	attr_accessor :name, :pets
  	attr_reader :species


  	def initialize(species)
  		@species = species
		@pets = {fishes: [], cats: [], dogs: []}
		save
	end

	def owners
		@owners
	end

	def save
		OWNERS << self
	end

	def self.all 
		OWNERS
	end

	def species
		@species
	end

	def self.count
		OWNERS.size
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
		pets[:cats] << cat
	end

	def buy_dog(dog_name)
		dog = Dog.new(dog_name)
		pets[:dogs] << dog
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

	def self.reset_all
		OWNERS.clear
	end

	def say_species
		"I am a #{self.species}."
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
		"I have #{pets[:fishes].size} fish, #{pets[:dogs].size} dog(s), and #{pets[:cats].size} cat(s)."
	end


end