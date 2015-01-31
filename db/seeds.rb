require 'faker'

5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password
  )
end

10.times do
  question = Question.create(
    text: Faker::Lorem.sentence
  )

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