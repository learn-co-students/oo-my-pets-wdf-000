require 'pry'
class Owner
  attr_accessor :pets, :name
  attr_reader :species

  @@owners = []
  def initialize(species)
    @pets = {fish: [], dogs:[], cats:[]}
    @species = species
    save
  end

  def save
    @@owners << self
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
    @species.match(/^[aAeEoOuUiI]/).nil? ? "I am a #{@species}." : "I am an #{@species}."
  end

  def buy_fish(fish_name)
    fish = Fish.new(fish_name)
    @pets[:fish] << fish
  end

  def buy_cat(cat_name)
    cat = Cat.new(cat_name)
    @pets[:cats] << cat
  end

  def buy_dog(dog_name)
    dog = Dog.new(dog_name)
    @pets[:dogs] << dog
  end

  def walk_dogs
    @pets[:dogs].collect {|dog| dog.mood = "happy"}
  end

  def play_with_cats
    @pets[:cats].collect {|cat| cat.mood = "happy"}
  end

  def feed_fish
    @pets[:fish].collect{|fish| fish.mood = "happy"}
  end

  def sell_pets
    @pets.keys.each do |pet_type|
      @pets[pet_type].collect {|pet| pet.mood = "nervous"}
      @pets[pet_type].clear
    end
  end

  def list_pets
    phrase = "I have "
    pet_data = @pets.keys.collect do |pet_type|
      "#{@pets[pet_type].count} #{pet_type.id2name}"
    end.collect do |pet|
      if pet.start_with?("1") && pet.end_with?("s")  #Mind your grammar!
        pet.chop!
      else
        pet
      end
    end
    phrase += pet_data.join(", ") + "."
    phrase.gsub(/(\,\s)(\d\s\w+\.)/, ", and \\2" ) #Use Oxford comma
  end

end
