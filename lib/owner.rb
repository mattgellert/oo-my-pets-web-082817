require 'pry'
class Owner

  attr_accessor :name, :pets
  attr_reader :species

  @@all = []

  def self.all
    @@all
  end

  def self.reset_all
    @@all = []
  end

  def self.count
    @@all.length
  end

  def initialize(name)
    @name = name
    @@all << self
    @species = "human"
    @pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def say_species
    "I am a human."
  end

  def buy_animal(animal_type, class_name, animal_name)
    pets[animal_type] << class_name.new(animal_name)
  end

  def buy_fish(fish_name)
    buy_animal(:fishes, Fish, fish_name)
  end

  def buy_cat(cat_name)
    buy_animal(:cats, Cat, cat_name)
  end

  def buy_dog(dog_name)
    buy_animal(:dogs, Dog, dog_name)
  end

  def makes_happy(type_of_animal)
    self.pets[type_of_animal][0].mood = "happy"
  end

  def walk_dogs
    makes_happy(:dogs)
  end

  def play_with_cats
    makes_happy(:cats)
  end

  def feed_fish
    makes_happy(:fishes)
  end

  def sell_pets
    pets_array = []
    @pets.each do |type, pets|
      pets.each do |pet|
        pets_array << pet
      end
    end
    @pets = {:fishes => [], :dogs => [], :cats => []}
    pets_array.each do |pet|
      pet.mood = "nervous"
    end
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end
