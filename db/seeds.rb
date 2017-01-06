# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..20).each do 	
	Profile.create(fullname: FFaker::Name.name, email: FFaker::Internet.email, birthdate: Time.now, is_male: [true, false].sample, address: FFaker::Address.street_address, phone: FFaker::PhoneNumber.phone_number) 
end	

User.create(email: "nt.apple.it@gmail.com", password: "123456", password_confirmation: "123456")