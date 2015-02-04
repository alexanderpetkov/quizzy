require 'sinatra'
require 'sinatra/json'
require 'rerun'
require 'sinatra/activerecord'
require 'sinatra/namespace'

Dir['lib/*.rb'].each { |file| require_relative file }
Dir['models/*.rb'].each { |file| require_relative file }
Dir['controllers/*.rb'].each { |file| require_relative file }

set :port, 1889
set :bind, '0.0.0.0'

use Rack::Session::Cookie, key: 'rack.session', secret: 'change one day'

get '/' do
  erb :index
end
