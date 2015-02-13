require 'rerun'
require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'
require 'sinatra/namespace'
require 'chartkick'

libdir = File.dirname(__FILE__) + '/lib'
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require 'quizzy'

Dir['models/*.rb'].each { |file| require_relative file }
Dir['controllers/*.rb'].each { |file| require_relative file }
Dir['helpers/*.rb'].each { |file| require_relative file }

set :port, 1889
set :bind, '0.0.0.0'

use Rack::Session::Cookie, key: 'rack.session', secret: 'change one day'

get '/' do
  erb :home
end
