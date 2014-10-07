user1 =User.create(:email => "user1@blah.com", :password => 'password')
user2 = User.create(:email => "user2@blah.com",:password => 'password')

t1 = Tag.create(name: "Dog")
t2 = Tag.create(name: "Training")
t3 = Tag.create(name: "Cat")

q1 = Question.create(title: "Question1", content:"blah blah1",user: user1, tags: [t1,t2])
q2 = Question.create(title: "Question2", content:"blah blah2",user: user2, tags: [t3,t2])

Answer.create(question: q1, user: user2,content: "answerrrrrr")
Answer.create(question: q1, user: user2,content: "answerrrrrr")

qs1 = Quscore.create({user: user1, question: q2, point: 1})
qs2 = Quscore.create({user: user2, question: q2, point: 1})
qs3 = Quscore.create({user: user1, question: q1, point: 1})
qs4 = Quscore.create({user: user2, question: q1, point: 1})
