# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
brands = Brand.create!({ "name":"Jordan" })
brands.image.attach(io: File.open("#{Rails.root}/public/images/jordan-brand.png"), filename: "jordan-brand.png")
brands = Brand.create!({ "name":"Nike" })
brands.image.attach(io: File.open("#{Rails.root}/public/images/jordan_photo.jpg"), filename: "jordan_photo.jpg")
brands = Brand.create!({ "name":"Puma" })
brands.image.attach(io: File.open("#{Rails.root}/public/images/jordan-brand.png"), filename: "jordan-brand.png")
brands = Brand.create!({ "name":"Adidas" })
brands.image.attach(io: File.open("#{Rails.root}/public/images/adidas.jpg"), filename: "adidas.jpg")
brands = Brand.create!({ "name":"New Balance" })
brands.image.attach(io: File.open("#{Rails.root}/public/images/jordan-brand.png"), filename: "jordan-brand.png")
brands = Brand.create!({ "name":"Asics" })
brands.image.attach(io: File.open("#{Rails.root}/public/images/jordan-brand.png"), filename: "jordan-brand.png")

User.create!(
        {email: "admin@gmail.com", password: "admin", type_user: 2, login:"admin"}
)
User.create!(
        {email: "noadmin@gmail.com", password: "noadmin", type_user: 1, login:"noadmin"}
)



