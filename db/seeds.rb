# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'
require 'open-uri'
require 'json'

puts 'Cleaning up database...'
<<<<<<< HEAD
Volunteering.destroy_all
Project.destroy_all
User.destroy_all
puts 'Database cleaned'

# i = 0 ?
12.times do |i|
  User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: "user_#{i + 1}@gmail.com",
    password: "123456",
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    address: Faker::Address.street_address,
    avatar: Faker::Avatar.image,
    about_me: Faker::Quote.famous_last_words,
    level: rand(0..100)
  ).save!
end

project_1 = Project.new(
  user_id: User.first.id,
  title: "Weunited Medical Plants",
  location: "Ubud, Bali, Indonesia",
  description: "Based on the island of Nusa Penida, help to conserve the population of endangered medical plants. Assist with  cleaning while you’re based off the beaten track, enjoying island life away from modern distractions.",
  contact: Faker::PhoneNumber.cell_phone_in_e164,
  status: "open",
  start_date: Date.today + 5.day,
  end_date: Date.today + 1.month,
  start_time: "10:00:00",
  end_time: "15:00:00"
)

pic_1 = URI.open("https://images.unsplash.com/photo-1605449669747-35d71b9436f8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80")
project_1.photos.attach(io: pic_1, filename: "1.jpg", content_type: "image/jpg")
project_1.save!


project_2 = Project.new(
  user_id: User.first.id,
  title: "Daily Phonics with Friends",
  location: "Canggu, Bali, Indonesia",
  description: "Provide a fluent English-speaking perspective in language lessons in elementary schools, either taking classes on your own or with another volunteer.",
  contact: Faker::PhoneNumber.cell_phone_in_e164,
  status: "open",
  start_date: Date.today + 10.day,
  end_date: Date.today + 2.month,
  start_time: "12:00:00",
  end_time: "15:00:00"
)

pic_1 = URI.open("https://ivhq.imgix.net/images/projects/bali/volunteer-abroad-in-bali-ivhq-ubud-teaching.jpg?w=945&h=700&fit=crop&crop=faces,top&q=85&auto=format,compress")
pic_2 = URI.open("https://ivhq.imgix.net/images/projects/bali/volunteer-abroad-in-bali-ivhq-lovina-teaching.jpg?w=945&h=700&fit=crop&crop=faces,top&q=85&auto=format,compress")

project_2.photos.attach(io: pic_1, filename: "1.jpg", content_type: "image/jpg")
project_2.photos.attach(io: pic_2, filename: "1.jpg", content_type: "image/jpg")

project_2.save!

project_3 = Project.new(
  user_id: User.second.id,
  title: "Astungara Way",
  location: "Perenenan, Bali, Indonesia",
  description: "Supporting local farmers to raising rice fields. Organic farming non pesticide.",
  contact: Faker::PhoneNumber.cell_phone_in_e164,
  status: "open",
  start_date: Date.today + 1.day,
  end_date: Date.today + 3.month,
  start_time: "16:00:00",
  end_time: "19:00:00"
)

pic_1 = URI.open("https://images.unsplash.com/photo-1595009901108-41259ec1b3f6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
pic_2 = URI.open("https://images.unsplash.com/photo-1475332831881-e80974377cb7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2779&q=80")

project_3.photos.attach(io: pic_1, filename: "1.jpg", content_type: "image/jpg")
project_3.photos.attach(io: pic_2, filename: "1.jpg", content_type: "image/jpg")

project_3.save!

project_4 = Project.new(
  user_id: User.second.id,
  title: "Teaching Volunteer Program in Bali",
  location: "Lovina, Bali, Indonesia",
  description: "Interested in being a volunteer Teacher in Bali - Lovina? International Volunteer HQ’s Teaching project will see volunteers teaching school children valuable English language skills and sharing their culture. Volunteers gain teaching experience and help improve access to education within the local community which can help kids stay in school, continue with further education and opens doors to better employment opportunities later in life.",
  contact: Faker::PhoneNumber.cell_phone_in_e164,
  status: "open",
  start_date: Date.today + 2.day,
  end_date: Date.today + 3.month,
  start_time: "15:00:00",
  end_time: "18:00:00"
)

pic_1 = URI.open("https://ivhq.imgix.net/images/projects/bali/volunteer-abroad-in-bali-ivhq-lovina-kindergarten.jpg?w=945&h=700&fit=crop&crop=faces,top&q=85&auto=format,compress")

project_4.photos.attach(io: pic_1, filename: "1.jpg", content_type: "image/jpg")

project_4.save!


project_5 = Project.new(
  user_id: User.third.id,
  title: "Beach Cleanup Sunday",
  location: "Canggu, Bali, Indonesia",
  description: "Cleaning Echo Beach",
  contact: Faker::PhoneNumber.cell_phone_in_e164,
  status: "open",
  start_date: Date.today + 1.day,
  end_date: Date.today + 1.month,
  start_time: "09:00:00",
  end_time: "14:00:00"
)

pic_1 = URI.open("https://images.unsplash.com/photo-1618477461853-cf6ed80faba5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
pic_2 = URI.open("https://images.unsplash.com/photo-1616680214084-22670de1bc82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80")
pic_2 = URI.open("https://images.unsplash.com/photo-1569254982489-93e2fdf7fd45?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1471&q=80")


project_5.photos.attach(io: pic_1, filename: "1.jpg", content_type: "image/jpg")
project_5.photos.attach(io: pic_2, filename: "1.jpg", content_type: "image/jpg")
project_5.photos.attach(io: pic_3, filename: "1.jpg", content_type: "image/jpg")

project_5.save!

project_6 = Project.new(
  user_id: User.last.id,
  title: "Experience Teaching Coding in Bali",
  location: "Canggu, Bali, Indonesia",
  description: "Teach local big kids who want to learn Ruby on Rails. Indonesia’s magical island paradise is one of the world’s most popular developer and digital nomad hubs with a fast-growing startup scene. The multicultural environment of our coding bootcamp in Bali.",
  contact: Faker::PhoneNumber.cell_phone_in_e164,
  status: "open",
  start_date: Date.today + 10.day,
  end_date: Date.today + 9.week,
  start_time: "09:00:00",
  end_time: "18:00:00"
)

pic_1 = URI.open("https://res.cloudinary.com/wagon/image/upload/c_fill,h_880,q_auto,w_1120/v1581408831/onelfrdtvaqq49itf5q8.webp")

project_6.photos.attach(io: pic_1, filename: "1.jpg", content_type: "image/jpg")

project_6.save!

volunteering_1 = Volunteering.new(
	user_id: User.third.id,
	project_id: Project.first.id,
	status: "pending",

)
volunteering_1.save!

volunteering_2 = Volunteering.new(
	user_id: User.last.id,
	project_id: Project.last.id,
	status: "pending",

)
volunteering_2.save!

volunteering_3 = Volunteering.new(
	user_id: User.third.id,
	project_id: Project.second.id,
	status: "confirmed",
)
volunteering_3.save!

volunteering_4 = Volunteering.new(
	user_id: User.third.id,
	project_id: Project.third.id,
	status: "rejected",
)
volunteering_4.save!
=======
Project.destroy_all
User.destroy_all
Volunteering.destroy_all
puts 'Database cleaned'
>>>>>>> master
