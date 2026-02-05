# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

Task.destroy_all
Project.destroy_all

project1 = Project.create!(
  project_name: "project one",
  description: "This is project one"
)

project2 = Project.create!(
  project_name: "project two",
  description: "This is project two"
)

Task.create!(
  title: "first task of project one",
  status: :to_do,
  project: project1
)

Task.create!(
  title: "second task of project one",
  status: :in_progress,
  project: project1
)

Task.create!(
  title: "third task of project one",
  status: :done,
  project: project1
)

Task.create!(
  title: "first task of project two",
  status: :to_do,
  project: project2
)

puts "Seeding complete"