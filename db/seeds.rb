# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(
	name: 'Paul',
	surname: 'Rudnicki',
	email: 'pawelrudnicki79@gmail.com',
	password: 'password'
)

# user2 = User.create!(
# 	name: 'Tomasz',
# 	surname: 'Nowacki',
# 	login: 'tomasz',
# 	email: 'tomasz@gmail.com',
# 	password: 'password'
# )



10.times do
	cat_name = Faker::Lorem.word.capitalize
	category = Category.create(
		name: cat_name
	)

	city = Faker::Address.city
	geolocation = Geolocation.create(
		name: city
	)
	
	# end_date = Time.now + rand(2..30).days
	advertisment = Advertisment.create(
		title: Faker::Name.title,
		content: Faker::Lorem.paragraphs,
		price: Faker::Commerce.price,
		user: user,
		realization: 14,
		category: category,
		geolocation: geolocation
	)

	offer = Offer.create(
		content: Faker::Lorem.paragraphs,
		price: Faker::Commerce.price,
		realization: Faker::Date.forward,
		user: user,
		advertisment: advertisment
	)

	# page_title = Faker::Name.title
	# page = Page.create(
	# 	title: page_title,
	# 	content: Faker::Lorem.paragraphs,
	# 	slug: page_title.parameterize
	# )

end
