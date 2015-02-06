require 'faker'

p 'creating non-admin users'

5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    admin: false
  )
end

p 'creating admins'

2.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    admin: true
  )
end

p 'creating categories'

categories = []

5.times do
  categories << Category.create(
    name: Faker::Lorem.word
  )
end

p 'creating questions and answers'

10.times do
  question = Question.create(
    text: Faker::Lorem.sentence
  )

  categories[rand(5)].questions << question

  rand(1..2).times do
    question.answers << Answer.create(
      text: Faker::Lorem.sentence,
      is_correct: true
    )
  end

  rand(2..3).times do
    question.answers << Answer.create(
      text: Faker::Lorem.sentence,
      is_correct: false
    )
  end
end