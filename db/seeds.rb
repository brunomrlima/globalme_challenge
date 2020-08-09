# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#

TaskGroup.parameters(1).each do |params|
  30.times{User.create(params[0].merge({name: Faker::Name.unique.name, email: Faker::Internet.unique.email}))}
end

