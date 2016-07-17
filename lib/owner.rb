class Owner
  # code goes here
  attr_accessor :name, :pets
  attr_reader :species

  @@all = []
  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

  def initialize(species)
    @species = species
    @pets = {fishes: [], dogs: [], cats: []}
    self.class.all << self
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(name)
    self.pets[:fishes] << Fish.new(name)
  end

  def buy_cat(name)
    self.pets[:cats] << Cat.new(name)
  end

  def buy_dog(name)
    self.pets[:dogs] << Dog.new(name)
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
    self.pets.values.each do |pets_arr|
      pets_arr.each {|pet| pet.mood = "nervous"}
    end
    self.pets.clear
  end

  def list_pets
    "I have #{count(:fishes)} fish, #{count(:dogs)} dog(s), and #{count(:cats)} cat(s)."
  end

  private
  def count(type = nil)
    type ? self.pets[type].count : self.pets.values.flatten.count
  end
end