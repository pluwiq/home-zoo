# frozen_string_literal: true

require_relative 'cat'
require_relative 'dog'
require_relative 'animal_info'

def main
  cats = [
    Cat.new('Amely', 2, 'white', 6),
    Cat.new('Blake', 4, 'black', 5)
  ]
  dogs = [
    Dog.new('Rex', 2, 'ginger', 20),
    Dog.new('Din', 6, 'white', 25)
  ]

  loop do
    puts "Welcome to the Home Zoo!"
    puts "What do you want to do?"
    puts "1. Add a new animal"
    puts "2. Show all animals"
    puts "3. Find animal by name"
    puts "4. Remove animal by name"
    puts "5. Change information about the animal"
    puts "6. Exit"
    choice = gets.chomp.to_i

    case choice
    when 1
      add_animal(cats, dogs)
    when 2
      show_all_animals(cats, dogs)
    when 3
      find_animal(cats, dogs)
    when 4
      delete_animal(cats, dogs)
    when 5
      edit_animal(cats, dogs)
    when 6
      break
    else
      puts "Wrong choice, please try again."
    end
  end
end

def add_animal(cats, dogs)
  puts "What animal would you like to add? (cat/dog)"
  animal_type = gets.chomp.downcase

  unless %w[cat dog].include?(animal_type)
    puts "Unknown type of animal!"
    return
  end

  name = ''
  loop do
    puts "Enter animal name (letters only):"
    name = gets.chomp
    if name.match?(/\A[a-zA-Z]+\z/)
      break
    else
      puts "Error: Name should contain only letters."
    end
  end

  age = ''
  loop do
    puts "Enter the age of the animal (digits only):"
    age = gets.chomp
    if age.match?(/\A\d+\z/)
      age = age.to_i
      break
    else
      puts "Error: Age should contain only digits."
    end
  end

  wool_color = ''
  loop do
    puts "Enter the animal's coat color (letters only):"
    wool_color = gets.chomp
    if wool_color.match?(/\A[a-zA-Z]+\z/)
      break
    else
      puts "Error: Coat color should contain only letters."
    end
  end

  weight = ''
  loop do
    puts "Enter the animal's weight in pounds (digits only):"
    weight = gets.chomp
    if weight.match?(/\A\d+\z/)
      weight = weight.to_i
      break
    else
      puts "Error: Weight should contain only digits."
    end
  end

  case animal_type
  when 'cat'
    cats << Cat.new(name, age, wool_color, weight)
  when 'dog'
    dogs << Dog.new(name, age, wool_color, weight)
  end

  puts "#{animal_type.capitalize} named #{name} added successfully!"
end

def show_all_animals(cats, dogs)
  puts "Cats:"
  cats.each { |cat| animal_info(cat) }
  puts "Dogs:"
  dogs.each { |dog| animal_info(dog) }
end

def find_animal(cats, dogs)
  puts "Enter the name of the animal to search:"
  name = gets.chomp
  animal = (cats + dogs).find { |animal| animal.name.downcase == name.downcase }
  if animal
    animal_info(animal)
  else
    puts "Animal named #{name} was not found."
  end
end

def delete_animal(cats, dogs)
  puts "Enter the name of the animal to delete:"
  name = gets.chomp
  animal = (cats + dogs).find { |animal| animal.name.downcase == name.downcase }
  if animal
    cats.delete(animal) || dogs.delete(animal)
    puts "Animal named #{name} has been removed."
  else
    puts "Animal named #{name} was not found."
  end
end

def edit_animal(cats, dogs)
  puts "Enter the name of the animal to edit:"
  name = gets.chomp
  animal = (cats + dogs).find { |animal| animal.name.downcase == name.downcase }
  if animal
    age = ''
    loop do
      puts "Enter new age of the animal (digits only):"
      age = gets.chomp
      if age.match?(/\A\d+\z/)
        animal.age = age.to_i
        break
      else
        puts "Error: Age should contain only digits."
      end
    end

    wool_color = ''
    loop do
      puts "Enter a new animal fur color (letters only):"
      wool_color = gets.chomp
      if wool_color.match?(/\A[a-zA-Z]+\z/)
        animal.wool_color = wool_color
        break
      else
        puts "Error: Coat color should contain only letters."
      end
    end

    weight = ''
    loop do
      puts "Enter the animal's new weight (in pounds, digits only):"
      weight = gets.chomp
      if weight.match?(/\A\d+\z/)
        animal.weight = weight.to_i
        break
      else
        puts "Error: Weight should contain only digits."
      end
    end

    puts "Animal information has been updated."
  else
    puts "Animal named #{name} was not found."
  end
end

if __FILE__ == $0
  main
end