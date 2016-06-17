class Owner
  # code goes here
  @@all = []

  def self.all
    @@all
  end

  def self.reset_all
    self.all.clear
  end

  def self.count
    self.all.length
  end

  # instance methods
  
  attr_reader :species
  attr_accessor :name, :pets

  def initialize(species)
    @species = species
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @@all << self
  end

  def say_species
    "I am a #{@species}."
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
    @pets[:dogs].each{|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].each{|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fishes].each{|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.each{|type,pets|
      pets.each{|pet| pet.mood = "nervous"}
      pets.clear 
    }
  end

  def list_pets
    counts = @pets.values.map{|x| x.length}
    "I have #{counts[0]} fish, #{counts[1]} dog(s), and #{counts[2]} cat(s)."
  end
end
