# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
sandwich1 = Sandwich.create(name: 'Bologna', bread_type: 'white')
sandwich2 = Sandwich.create(name: 'Bacon', bread_type: 'rye')
sandwich3 = Sandwich.create(name: 'PeanutButter', bread_type: 'wheat')
ingredient1 = Ingredient.create(name:'mayo', calories:20)
ingredient2 = Ingredient.create(name:'cilantro', calories:5)
ingredient3 = Ingredient.create(name: 'mustard', calories: 10)
ingredient4 = Ingredient.create(name: 'tomatoes', calories: 15)

sandwich1.ingredients.push(ingredient1)
sandwich1.ingredients.push(ingredient3)
sandwich1.ingredients.push(ingredient4)

sandwich2.ingredients.push(ingredient1)
sandwich2.ingredients.push(ingredient2)
sandwich2.ingredients.push(ingredient3)
sandwich2.ingredients.push(ingredient4)

sandwich3.ingredients.push(ingredient1)
