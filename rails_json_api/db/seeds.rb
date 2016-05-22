3.times do |i|
  User.create(username: "user#{i}", email: "user#{i}@example.com")
end
