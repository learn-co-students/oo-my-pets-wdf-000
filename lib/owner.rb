class Owner

  attr_accessor :name, :pets

  @@all = []

  def initialize(species)
    @species = species
    @pets = {
      :cats => [],
      :dogs => [],
      :fishes => []

    }
    #save
    @@all << self

  end

  def self.all
   @@all
  end

  def self.reset_all
     self.all.clear

  end

  def self.count
    self.all.count

  end

  def species
    @species
  end

  def say_species
    "I am a #{@species}."
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
    self.pets[:dogs] = self.pets[:dogs].map{|dog| dog.mood = "happy"}
  end

  def play_with_cats
    self.pets[:cats] = self.pets[:cats].map{|dog| dog.mood = "happy"}
  end

  def feed_fish
    self.pets[:fishes] = self.pets[:fishes].map{|dog| dog.mood = "happy"}
  end

  def sell_pets

     self.pets.values.flatten.each {|pet| pet.mood = "nervous"}
     self.pets = {
       :cats => [],
       :dogs => [],
       :fishes => []

     }
  end

  def list_pets
    "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
  end




end
