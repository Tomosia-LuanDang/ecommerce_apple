User.delete_all
User.create!(
  email:                 "luan@gmail.com",
  name:                  "Luan Dang",
  phone:                 "0389 456 666",
  gender:                true,
  role:                  1,
  avatar:                "varun.jpg",
  is_active:             true,
  password:              "123123",
  password_confirmation: "123123",
  created_at:            Time.zone.now
)

30.times do |n|
  password = "123123"
  User.create!(
    email:                 Faker::Internet.email,
    name:                  Faker::Name.name,
    phone:                 Faker::PhoneNumber.cell_phone,
    gender:                Faker::Gender.binary_type.downcase,
    role:                  0,
    avatar:                "varun.jpg",
    is_active:             true,
    password:              password,
    password_confirmation: password,
    created_at:            Time.zone.now
  )
end
