user1 =User.create(:email => "user1@blah.com", :password => 'password')
user2 = User.create(:email => "user2@blah.com",:password => 'password')

t0 = Tag.create(name: "Play")
t1 = Tag.create(name: "Dog")
t2 = Tag.create(name: "Training")
t3 = Tag.create(name: "Cat")
t4 = Tag.create(name: "Events")
t5 = Tag.create(name: "Exercise")
t6 = Tag.create(name: "Outdoor")
t7 = Tag.create(name: "Walk")
t8 = Tag.create(name: "Hunting")
t9 = Tag.create(name: "Behavior")

 q1 = Question.create(title: "Question1", content:"blah blah1",user: user1, tags: [t1,t2])
# q2 = Question.create(title: "Question2", content:"blah blah2",user: user2, tags: [t3,t2])

# a1 = Answer.create(question: q1, user: user2,content: "answerrrrrr")
# a2 = Answer.create(question: q1, user: user2,content: "answerrrrrr")

# qs1 = Quscore.create({user: user1, question: q2, point: 1})
# qs2 = Quscore.create({user: user2, question: q2, point: 1})
# qs3 = Quscore.create({user: user1, question: q1, point: 1})
# qs4 = Quscore.create({user: user2, question: q1, point: 1})

# as1 = Anscore.create({ user: user1, answer: a1 ,point:1 })

30.times do |u|
  u = User.new(email: Faker::Internet.email, password: 'password')
  u.save
end

60.times do |q|
  q = Question.new(title: Faker::Lorem.sentence,
                  content: Faker::Lorem.paragraph(2),
                  user: User.find(rand(5)+1),
                  tags: [ Tag.find(rand(10) + 1),
                          Tag.find(rand(10) + 1),
                          Tag.find(rand(10) + 1)])
  q.save
end

70.times do |a|
  a = Answer.new(question: Question.find(rand(10)+1), user: User.find(rand(5)+1),
                content: Faker::Lorem.paragraph(3))
  a.save
end

10.times do |num|
  10.times do |t |
    Quscore.create(user: User.find(num + 1), question: Question.find(t + 1), point: 1)
  end
end

10.times do |num|
  30.times do |t |
    Anscore.create(user: User.find(num + 1), answer: Answer.find(t + 1) , point: 1)
  end
end

User.create(email: 'Matthew.J.Viens@gmail.com', password: 'password')



