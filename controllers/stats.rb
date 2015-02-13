namespace '/stats' do
  post '/my' do
    user = User.find(session[:current_user].id)
    category = params[:wanted_category]
    stats = category ? user.statistics_by_category(category) : user.statistics

    textified_stats = stats.map do |answering|
      result = answering.is_correct ? 'Correct' : 'Wrong'

      "#{result}.\n#{Question.find(answering.question_id).text_representation}"
    end

    erb :stats, locals: {
      is_checked: category,
      stats: textified_stats,
      categories: Category.all.map(&:name),
      user_id: user.id
    }
  end
end