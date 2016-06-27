class Owner
  # code goes here
  attr_accessor :name, :pets, :fish, :dog, :cat
  attr_reader :species 

  @@all = []
  def initialize(pets)
    pets = Hash.new
    pets[:fishes] = []
    pets[:dogs] = []
    pets[:cats] = []
    @pets = pets

    @@all << self
    @species = "human"
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all = @@all.clear
  end

  def self.count
    @@all.size
  end

  def say_species
   return "I am a #{self.species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].collect { |dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].collect { |dog| dog.mood = "happy"}  
  end

  def feed_fish
    @pets[:fishes].collect { |dog| dog.mood = "happy"}  
  end


  def sell_pets
     @pets.each do |key, value|
     value.collect {|pet| pet.mood = "nervous" }
     value.clear
   end
  end

  def list_pets
    return "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

end