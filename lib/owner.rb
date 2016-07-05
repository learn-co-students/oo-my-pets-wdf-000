class Owner
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []

  def initialize(species)
    @species = species
    self.class.all << self
    @pets = { fishes: [], dogs: [], cats: []}
  end
  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def say_species
    "I am a #{self.species}."
  end

  def buy_fish(fish_name)
    self.pets[:fishes] << Fish.new(fish_name)
  end

  def buy_cat(cat_name)
    self.pets[:cats] << Cat.new(cat_name)
  end

  def buy_dog(dog_name)
    self.pets[:dogs] << Dog.new(dog_name)
  end

  def walk_dogs
    self.pets[:dogs].each { |dog| dog.mood = "happy" }
  end

  def play_with_cats
    self.pets[:cats].each { |cat| cat.mood = "happy" }
  end

  def feed_fish
    self.pets[:fishes].each { |fish| fish.mood = "happy" }
  end

  def sell_pets
    self.pets.each do |type, pets_array|
      pets_array.each { |pet| pet.mood = "nervous" }
      pets_array.clear
    end
  end

  def list_pets
    fish_count = self.pets[:fishes].count
    dogs_count = self.pets[:dogs].count
    cats_count = self.pets[:cats].count

    "I have #{fish_count} fish, #{dogs_count} dog(s), and #{cats_count} cat(s)."
  end
end
