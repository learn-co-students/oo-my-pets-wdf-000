class Owner
  attr_accessor :pets, :name
  attr_reader :species

  @@owner = []
  @@counter = 0

  def initialize(species)
    @pets = {:fishes => [], cats: [], dogs: []}
    @species = "human"
    @@owner << self
    @@counter += 1
  end

  def self.all
    @@owner
  end

  def self.reset_all
    @@owner = []
    @@counter = 0
  end

  def self.count
    @@counter
  end

  def say_species
    return "I am a #{@species}."
  end

  def buy_fish(fish)
    new_fish = Fish.new(fish)
    @pets[:fishes] << new_fish
  end

  def buy_cat(cat)
    new_cat = Cat.new(cat)
    @pets[:cats] << new_cat
  end
  
  def buy_dog(dog)
    new_dog = Dog.new(dog)
    @pets[:dogs] << new_dog    
  end

  def walk_dogs
    @pets[:dogs].each do |d|
      d.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each {|c| c.mood = "happy"} 
  end

  def feed_fish
    @pets[:fishes].each {|f| f.mood = "happy"}
  end

  def sell_pets
    @pets.each do |pet_type, pet_individual|
     pet_individual.each do |x|
      x.mood = "nervous"
      end
    end
    @pets = []
  end

  def list_pets
    "I have #{@pets[:fishes].count} fish, #{@pets[:dogs].count} dog(s), and #{@pets[:cats].count} cat(s)."
  end

end