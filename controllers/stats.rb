namespace '/stats' do
  get '/my' do
    stats = User.find(session[:current_user].id).statistics

    textified_stats = stats.map do |answering|
      Question.find(answering.question_id).text_representation
    end

    erb :stats, locals: { stats: textified_stats }
  end
end