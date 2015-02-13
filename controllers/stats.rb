namespace '/stats' do
  get '/my' do
    erb :stats, locals: { stats: User.find(session[:current_user].id).statistics.to_json }
  end
end