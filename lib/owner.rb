require 'pry'

class Owner
  
@@all = []


attr_accessor :name, :pets, :dog, :cat, :fish
attr_reader :species


	def initialize(species)
		@species = species
		@@all << self
		@pets = {fishes: [], dogs: [], cats: []}
	end

	def self.all
		@@all
	end

	def self.count
		all.count
	end

	def self.reset_all
		all.clear
	end

	def say_species
	 "I am a #{species}."
	end

	def buy_fish(fish)
		new_fish = Fish.new(fish)
		@pets[:fishes] << new_fish
		# @pets[:fishes].each do |fish|
		# 	 fish = new_fish
		# end
		@pets[:fishes].count
	end

	def buy_cat(cat)
		new_cat = Cat.new(cat)
		@pets[:cats] << new_cat
		@pets[:cats].count
	end
		
	def buy_dog(dog)
		new_dog = Dog.new(dog)
		@pets[:dogs] << new_dog
		@pets[:dogs].count
	end

	def walk_dogs
		@pets[:dogs].map do |feelings|
			feelings.mood="happy"
			feelings
		end
	end

	def play_with_cats
		@pets[:cats].map do |feelings|
			feelings.mood="happy"
			feelings
		end
	end


	def feed_fish
		@pets[:fishes].map do |feelings|
			feelings.mood="happy"
			feelings
		end
	end

	def sell_pets
		@pets.map do |type, pets|
			pets.map do |feelings|
				feelings.mood="nervous"
			end
		end
		@pets.clear
	end

	def list_pets
		@pets[:fishes].count
		@pets[:cats].count
		@pets[:dogs].count

	"I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
	end

end