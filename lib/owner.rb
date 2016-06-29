require 'pry'
class Owner

  attr_accessor :name, :pets

  attr_reader :species 

  @@all = []

  def initialize(species)
    @species=species
    @pets = {
      :fishes => [],
      :dogs => [],
      :cats => []
    }

    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
   "I am a human."
  end

  def buy_fish(fishname)
    Fish.new(fishname).tap { |fish| @pets[:fishes] << fish }
  end

  def buy_cat(catname)
    Cat.new(catname).tap { |cat| @pets[:cats] << cat } 
  end

  def buy_dog(dogname)
    Dog.new(dogname).tap { |dog| @pets[:dogs] << dog}
  end

  def walk_dogs
    @pets[:dogs].map! do |dog|
      dog.mood = 'happy'
    end
  end

  def play_with_cats
    @pets[:cats].map! do |cat|
      cat.mood = 'happy'
    end
  end

  def feed_fish
    @pets[:fishes].map! do |fish|
      fish.mood = 'happy'
    end
  end

  def sell_pets
    @pets.each do |pets_hash, pets_array|
      # binding.pry
      pets_array.map! do |pets|
        pets.mood = 'nervous'
      end
      pets_array.clear
    end
  end

  def list_pets
    fish_count = @pets[:fishes].count
    dog_count = @pets[:dogs].count
    cat_count = @pets [:cats].count
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

end
