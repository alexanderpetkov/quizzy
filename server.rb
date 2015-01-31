require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'

Dir['models/*.rb'].each { |file| require_relative file }

set :port, 1889
set :bind, '0.0.0.0'
# set :public_folder, proc { File.join(root, 'public') }

get '/' do
  redirect 'index.html', 303
end

