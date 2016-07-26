class Owner
  # code goes here
  attr_accessor :name, :pets

  attr_reader :species

  @@owners = []

  def initialize(name) #i love you! you're doing great <3
    @name = name
    @@owners << self
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@owners
  end

  def self.reset_all
    @@owners.clear
  end

  def self.count
    @@owners.count
  end

  def say_species
    return "I am a #{species}."
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
    bruh = @pets[:dogs]
    bruh.map do |dog|
      dog.mood = "happy"
    end
  end

  def play_with_cats
    bro = @pets[:cats]
    bro.map do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    broheem = @pets[:fishes]
    broheem.map do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    pets.map do |hash, species|
      species.map do |pet|
        pet.mood = "nervous"
      end
    end
    pets.clear
  end

  def list_pets
    son = pets[:fishes].count
    ayo = pets[:dogs].count
    b = pets[:cats].count
    return "I have #{son} fish, #{ayo} dog(s), and #{b} cat(s)."
  end

end