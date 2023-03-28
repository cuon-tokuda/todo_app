# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Task.create!(name: "todo app", deadline: DateTime.new(2023, 4, 30), priority: "high", status: 1); 
Task.create!(name: "clean the room", deadline: DateTime.new(2023, 4, 15, 12), priority: "medium", status: 2); 
Task.create!(name: "buy groceries", deadline: DateTime.new(2023, 4, 17, 18), priority: "low", status: 2); 
Task.create!(name: "finish homework", deadline: DateTime.new(2023, 4, 20), priority: "high", status: 1); 
Task.create!(name: "read book", deadline: DateTime.new(2023, 4, 30), priority: "medium", status: 0) 

