require 'pry'

class Owner
  attr_accessor :name
  attr_reader :species


  @@all= []

  def initialize(name)
    @species = name
    @@all << self
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def say_species
    "I am a #{species}."
  end

  def pets=(pet)
    @pets = pet
  end

  def pets
    @pets
  end

  def buy_fish(fish)
    #you need to store the object of fish that contains the name bubble!!!
    pets.each do |specie,pet|
      if specie.to_s=="fishes"
        pets[specie] << Fish.new(fish)
        # binding.pry
      end
    end
  end

  def buy_cat(cat)
    #you need to store the object of fish that contains the name bubble!!!
    pets.each do |specie,pet|
      if specie.to_s=="cats"
        pets[specie] << Cat.new(cat)
        # binding.pry
      end
    end
  end

  def buy_dog(dog)
    #you need to store the object of fish that contains the name bubble!!!
    pets.each do |specie,pet|
      if specie.to_s=="dogs"
        pets[specie] << Dog.new(dog)
        # binding.pry
      end
    end
  end

  def walk_dogs
    #you need to store the object of fish that contains the name bubble!!!
    pets.each do |specie,pet|
      if specie.to_s=="dogs"
        pet.each do |doggy|
          doggy.mood = "happy"
        end
      end
    end
  end

  def play_with_cats
    #you need to store the object of fish that contains the name bubble!!!
    pets.each do |specie,pet|
      if specie.to_s=="cats"
        pet.each do |kitty|
          kitty.mood = "happy"
        end
      end
    end
  end

  def feed_fish
    #you need to store the object of fish that contains the name bubble!!!
    pets.each do |specie,pet|
      if specie.to_s=="fishes"
        pet.each do |nemo|
          nemo.mood = "happy"
        end
      end
    end
  end

  def sell_pets
    # pets.values.flatten.each{|pet| pet.mood = "nervous"}
    pets.each do |specie,pet|
      pet.each do |animal|
        animal.mood = "nervous"
      end
    end
    pets.clear
  end

  def list_pets
    "I have #{pets[:fishes].count} fish, #{pets[:dogs].count} dog(s), and #{pets[:cats].count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.count
  end

end
