@user = User.create(email: "test@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Jon", last_name: "Snow")

puts "1 User created"

AdminUser.create(email: "admin@test.com", password: "asdfasdf", password_confirmation: "asdfasdf", first_name: "Admin", last_name: "Name")

puts "1 Admin User created"

50.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id, overtime_request: 2.5)
end

puts "50 Posts have been created"