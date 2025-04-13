 100.times do |n|
    Post.create!(content: :"content#{n + 1}")
  end
