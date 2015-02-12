namespace '/quiz' do

  get do
    require_user_login

    erb :quiz, locals: {
      categories: Category.all.map(&:name)
    }
  end

  get '/start' do
    erb :start, locals: {
      questions: Category.questions_by_categories(params.keys)
    }
  end

  get '/finish' do
    answers = Answer.find(params.keys.map(&:to_i))
    question_ids = answers.map(&:question_id).uniq

    question_ids.each do |id|
      relevant_answers = answers.select { |answer| answer.question_id == id }
      correct = Question.find(id).correctly_answered?(relevant_answers.map(&:id))

      QuestionsUsers.create(
        user_id: session[:current_user].id,
        question_id: id,
        is_correct: correct
      )
    end

    erb :finish, locals: { params: params }
  end
end