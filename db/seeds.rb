require 'random_data'

User.destroy_all
Topic.destroy_all
Post.destroy_all
Comment.destroy_all
Label.destroy_all


5.times do
  User.create!(
  name:     RandomData.random_name,
  email:    RandomData.random_email,
  password: RandomData.random_sentence
  )
end
users = User.all


15.times do
  Topic.create!(
    name: RandomData.random_sentence,
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

topics.each { |t| rand(3..5).times { t.labels << Label.new(name: FFaker::Company.bs) } }


50.times do
  post = Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )

  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }

end


posts = Post.all
posts.each { |p| rand(3..5).times { p.labels << Label.new(name: FFaker::Company.bs) } }


100.times do
  Comment.create!(
    user: users.sample,
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

admin = User.create!(
  name:     'Admin User',
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
)

member = User.create!(
  name:     'Member User',
  email:    'member@example.com',
  password: 'helloworld'
)


puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"
