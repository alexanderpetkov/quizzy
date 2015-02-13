namespace '/questions' do
  get '/add' do
    require_admin_login
    erb :question
  end
end