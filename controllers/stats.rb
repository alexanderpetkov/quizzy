namespace '/stats' do
  post '/my' do
    user = User.find(session[:current_user].id)
    category = params[:wanted_category]
    stats = category ? user.statistics_by_category(category) : user.statistics

    textified_stats = stats.map do |answering|
      result = answering.is_correct ? 'Correct' : 'Wrong'

      "#{result}.\n#{Question.find(answering.question_id).text_representation}"
    end

    if category
      all_entries = QuestionsUsers.filter_by_category(category).select do |entry| 
        entry.user_id == user.id
      end

      correct_count = all_entries.select { |entry| entry.is_correct == true }.size

      chart_data = {
        'correct' => correct_count,
        'mistaken' => all_entries.size - correct_count
      }
    end

    erb :stats, locals: {
      is_checked: category,
      stats: textified_stats,
      categories: Category.all.map(&:name),
      chart_data: chart_data,
      user_id: user.id
    }
  end
end