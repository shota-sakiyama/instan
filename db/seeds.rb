50.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = "passwosrd"
  User.create!(name: name,
              email: email,
              password: password,
              password_confirmation: password,
              )
end
