# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


begin 
  10.times do |i|
    Article.create(id: i + 1, title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph)
  end
rescue => e
  p e
end

begin
  12.times do |i|
    Category.create(id: i + 1, name: Faker::Name.title, image: Faker::Avatar.image("example-#{i + 1}"))
  end
rescue
end
