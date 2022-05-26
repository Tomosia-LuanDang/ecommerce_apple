5.times do |n|
  name = ["iPhone", "iPad", "AirPods", "Macbook", "Apple Watch" ]
  Category.create!(
    name: name[n],
    created_at: Time.zone.now)
end

30.times do
  name = Faker::Device.model_name
  description = Faker::Lorem.paragraph_by_chars
  price = rand(15..20) * 1000000 + rand(1..99) * 10000
  Product.create!(
    name: name,
    price: price,
    image: nil,
    residual: 89,
    sold: 11,
    description: description,
    created_at: Time.zone.now)
end
