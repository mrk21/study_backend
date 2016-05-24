3.times do |i|
  user = User.create(username: "user#{i}", email: "user#{i}@example.com")
  3.times{|j| user.notes.create(title: "note #{i} #{j}")}
end
