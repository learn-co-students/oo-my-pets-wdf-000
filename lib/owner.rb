class Owner

  attr_accessor :name, :pets
  attr_reader :species
  
  @@owner = []

  def self.all 
    @@owner
  end

  def self.reset_all
    self.all.clear
  end
  
  def self.count
    @@owner.count
  end

  def initialize(species)
    @species = species
    @@owner << self
    @pets = {fishes: [], cats: [], dogs: []}
  end

  def species
    @species
  end

  def say_species
    return "I am a #{@species}."
  end

  # def name=(name)
  #   @name = name
  # end

  # def name
  #   name = @name
  # end

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
    @pets[:dogs][0].mood = "happy"
  end

  def play_with_cats
    @pets[:cats][0].mood = "happy"
  end

  def feed_fish
    @pets[:fishes][0].mood = "happy"
  end

  def sell_pets
    # @pets[:dogs][0].mood = "nervous"
    # @pets[:fishes][0].mood = "nervous"
    # @pets[:cats][0].mood = "nervous"
       
    @pets.each do |type, animals|
      animals.each do |pet|
        pet.mood = "nervous"
      end
      animals.clear
    end

    # @pets[:dogs] = []
    # @pets[:fishes] = []
    # @pets[:cats] = []
  end

  def list_pets
    fish = @pets[:fishes].count
    dog = @pets[:dogs].count
    cat = @pets[:cats].count
    return "I have #{fish} fish, #{dog} dog(s), and #{cat} cat(s)."
  end

end