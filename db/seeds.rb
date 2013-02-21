require 'faker'

20.times do 
  Tag.create :name => Faker::Lorem.word
end

all_tags = Tag.all

15.times do 
  post = Post.create :title   => Faker::Company.bs,
                     :body    => Faker::Lorem.paragraph
  post.tags << all_tags.sample(rand(1..3))                     
  post.save
end
