# Home Zoo

## Short Description

Console application in which you create different animals as well as their traits, skills and sounds.
Users can add, view, find, edit, and remove animals from the zoo. 
Each animal has specific attributes such as name, age, wool color and weight.

## Topics

* Classes
* Inheritance
* Liskov Substitution Principle

## Features

1. Add a new animal (Cat or Dog) with attributes: name, age, wool color, and weight.
2. Display information of all animals.
3. Find an animal by name.
4. Remove an animal by name.
5. Edit information about an existing animal.
6. Exit.

## Class Structure

* Animal

The Animal class has the following attributes and methods:
1. name: The name of the animal.
2. age: The age of the animal.
3. wool_color: The color of the animal's wool.
4. weight: The weight of the animal.
5. talk: An abstract method that returns the sound the animal makes.
6. info: Returns a string with the animal's name and age.

* Dog & Cat

1. wool_color: The color of the dog's || cat's wool.
2. weight: The weight of the dog || cat.
3. talk: Returns "woof" || "meow".

## Functions

1. animal_info(animal)
2. show_all_animals(cats, dogs)
3. add_animal(cats, dogs)
4. find_animal(cats, dogs)
5. delete_animal(cats, dogs)
6. edit_animal(cats, dogs)
7. main
