class Owner
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []

  def initialize(name)
    @pets = {:fishes => [], :dogs => [], :cats => []}
    @species = ""
    self.name = name
    self.class.all << self
    self.species = "human"
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
    self.pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets[:cats].each do |cat|
      cat.mood = "nervous"
    end

    self.pets[:cats] = []

    self.pets[:fishes].each do |fish|
      fish.mood = "nervous"
    end

    self.pets[:fishes] = []

    self.pets[:dogs].each do |dog|
      dog.mood = "nervous"
    end

    self.pets[:dogs] = []

  end

  def list_pets
    "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end

  def play_with_cats
    self.pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def say_species
     "I am a human."
  end

  def species=(new_species)
    if @species == ""
      @species = new_species
    else
      raise_error
    end
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

end
