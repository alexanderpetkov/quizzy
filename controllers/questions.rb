namespace '/questions' do
  get '/add' do
    require_admin_login
    erb :question
  end

  post '/upload' do
    unless params[:file] &&
           (tmpfile = params[:file][:tempfile]) &&
           (name = params[:file][:filename])
      return erb :question, locals: { message: "No file selected." }
    end

    full_text = ''

    while chunk = tmpfile.read(65536)
      STDERR.puts chunk.inspect

      full_text += chunk
    end
    Quizzy::Parser.parse_markdown(full_text)
    erb :question, locals: { message: "File with name #{name} was uploaded.", disabled: false }
  end
end