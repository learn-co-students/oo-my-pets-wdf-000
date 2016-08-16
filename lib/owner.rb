class Owner
  # code goes here
  attr_reader :species
  attr_accessor :name
  attr_accessor :pets
  @@all = []
  @@count = 0

  def initialize(name)
    @name = name
    @@all << self
    @@count += 1
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
    @@count = 0
  end

  def self.count
    @@count
  end

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    fish.human = self
    pets[:fishes].push(fish)
  end

  def buy_cat(name)
    cat = Cat.new(name)
    cat.human = self
    pets[:cats].push(cat)
  end

  def buy_dog(name)
    dog = Dog.new(name)
    dog.human = self
    pets[:dogs].push(dog)
  end

  def walk_dogs
  pets[:dogs].each do |dog|
    dog.mood = "happy"
  end
 end

 def play_with_cats
   pets[:cats].each do |cat|
     cat.mood = "happy"
   end
 end

 def feed_fish
   pets[:fishes].each do |fish|
     fish.mood = "happy"
   end
 end

 def sell_pets

   pets.each do |type, animals|

     animals.each do |pet|
       pet.mood = "nervous"
     end
     animals.clear
   end
 end

 def list_pets
   "I have #{pets[:fishes].size} fish, #{ pets[:dogs].size} dog(s), and #{ pets[:cats].size} cat(s)."
end

end
