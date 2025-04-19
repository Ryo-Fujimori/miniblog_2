 # メインのユーザー
 User.create!(email: "sampleuser01@email.com", password: "initsample01")

 100.times do |n|
    # email = Faker::Internet.unique.email
    # password = Faker::Internet.password(min_length: 6)
    # content = Faker::Lorem.sentence
    user = User.create!(email: Faker::Internet.unique.email, password: Faker::Internet.password(min_length: 6))
    user.posts.create!(content: Faker::Lorem.sentence)
  end
