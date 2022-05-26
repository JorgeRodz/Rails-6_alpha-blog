# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create email: "jarf4321@gmail.com", username: "jarf", password: "jorge123", admin: true

['leon', 'andres', 'natalia', 'camilo', 'rusbel', 'johan'].each do |name|
	User.create email: "#{name}@gmail.com", username: name, password: "#{name}123"
end

puts 'Users has been created'

['Restaurant', 'Sports', 'Travel', 'Cars', 'Tech', 'Science'].each do |name|
	Category.create name: name
end

puts 'Categories has been created'

