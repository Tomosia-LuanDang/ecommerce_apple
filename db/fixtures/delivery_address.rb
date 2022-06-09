DeliveryAddress.delete_all
20.times do
  user_id = rand 1..10
  User.find(user_id).delivery_addresses.create!(
    name:       Faker::Name.name,
    phone:      Faker::PhoneNumber.cell_phone,
    address:    Faker::Address.full_address,
    created_at: Time.zone.now
  )
end
