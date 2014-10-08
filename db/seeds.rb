user1 =User.create(:email => "user1@blah.com", :password => 'password')
user2 = User.create(:email => "user2@blah.com",:password => 'password')

# t1 = Tag.create(name: "Dog")
# t2 = Tag.create(name: "Training")
# t3 = Tag.create(name: "Cat")

# q1 = Question.create(title: "Question1", content:"blah blah1",user: user1, tags: [t1,t2])
# q2 = Question.create(title: "Question2", content:"blah blah2",user: user2, tags: [t3,t2])

# a1 = Answer.create(question: q1, user: user2,content: "answerrrrrr")
# a2 = Answer.create(question: q1, user: user2,content: "answerrrrrr")

# qs1 = Quscore.create({user: user1, question: q2, point: 1})
# qs2 = Quscore.create({user: user2, question: q2, point: 1})
# qs3 = Quscore.create({user: user1, question: q1, point: 1})
# qs4 = Quscore.create({user: user2, question: q1, point: 1})

# as1 = Anscore.create({ user: user1, answer: a1 ,point:1 })

5.times do |u|
  u = User.new(email: Faker::Internet.email, password: 'password')
  u.save
end

10.times do |q|
  q = Question.new(title: Faker::Lorem.sentence,
                  content: Faker::Lorem.paragraph(2),
                  user: User.find(rand(5)+1))
  q.save
end

20.times do |a|
  a = Answer.new(question: Question.find(rand(10)+1), user: User.find(rand(5)+1),
                content: Faker::Lorem.paragraph(3))
  a.save
end

10.times do |questionscore|
   questionscore = Quscore.new(user: User.find(rand(5)+1), question: Question.find(rand(10)+1), point: rand(10) > 3 ? 1 : -1)
   questionscore.save
end

10.times do |answerscore|
   answerscore = Anscore.new(user: User.find(rand(5)+1), answer: Answer.find(rand(10)+1), point: rand(10) > 3 ? 1 : -1)
   answerscore.save
end


Quscore.create(user: User.find(5), question: Question.find(3), point: 1)
Quscore.create(user: User.find(2), question: Question.find(3), point: 1)
Quscore.create(user: User.find(3), question: Question.find(3), point: 1)
Quscore.create(user: User.find(1), question: Question.find(3), point: -1)
User.create(email: 'Matthew.J.Viens@gmail.com', password: 'password')



