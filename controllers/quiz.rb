namespace '/quiz' do
  get do
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
    erb :finish, locals: { params: params }
  end
end