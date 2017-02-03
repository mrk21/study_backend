user = User.create(
  name: 'User 1',
  email: 'user1@example.com',
  password: 'password'
)

10.times do |i|
  Post.create(
    user: user,
    title: "title #{i+1}",
    body: "body #{i+1}"
  )
end
