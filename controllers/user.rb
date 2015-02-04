namespace '/user' do
  post '/login' do
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:current_user] = user
      json(user)
    else
      halt(400, { 'Content-Type' => 'application/json' }, 'Invalid username or password')
    end
  end

  get '/register' do
    erb :sign_up
  end

  post '/signup' do
    if params.values.include? ''
      "Empty field"
    elsif params[:password] != params[:password_repeat]
      "Password difference"
    else
      User.create(params.except('password_repeat'))
      redirect '/'
    end
  end
end