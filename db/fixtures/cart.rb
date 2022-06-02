Cart.delete_all

User.all.each do |user|
  Cart.seed do |s|
    s.user_id  = user.id
  end
end
