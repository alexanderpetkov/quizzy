namespace '/user' do
  post '/login' do
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:current_user] = user
      redirect '/quiz'
    else
      halt(400, { 'Content-Type' => 'application/json' },
           'Invalid username or password'
      )
    end
  end

  get '/register' do
    erb :sign_up
  end

  post '/signup' do
    if params.values.include? ''
      'Empty field'
    elsif params[:password] != params[:password_repeat]
      'Password difference'
    else
      user = User.create(params.except('password_repeat'))
      session[:current_user] = user
      redirect '/quiz'
    end
  end

  get '/logout' do
    require_user_login

    session[:current_user] = nil
    redirect '/'
  end
end
