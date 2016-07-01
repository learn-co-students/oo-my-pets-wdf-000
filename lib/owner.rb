require 'pry'

class Owner
	attr_reader :species 
	attr_accessor :name
	@pets = {}
	@@all = []
	def initialize (species)
		@species= species 
		@pets = {:fishes => [], :dogs => [], :cats => []}
		@@all << self
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
		"I am a " + @species + "."
	end
	def pets= (pets)
		@pets = pets
	end
	def pets
		@pets
	end

	def buy_fish(name)
		tmp = Fish.new(name)
		@pets[:fishes] << tmp
	end
	def buy_cat(name)
		tmp = Cat.new(name)
		@pets[:cats] << tmp
	end
	def buy_dog(name)
		tmp = Dog.new(name)
		@pets[:dogs] << tmp
	end
	def walk_dogs
		@pets[:dogs].map do | x |
			x.mood = 'happy'
		end
	end
	def play_with_cats
		@pets[:cats].map do | x |
			x.mood = 'happy'
		end
	end
	def feed_fish
		@pets[:fishes].map do | x |
			x.mood = 'happy'
		end
	end

	def sell_pets
		@pets.map do | k , v |
			v.map do | x |
				x.mood = 'nervous'
			end
			v.clear
		end
	end
	def list_pets
		"I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
		end
end

#h = Owner.new("human")
#puts h
