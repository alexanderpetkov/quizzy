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
end