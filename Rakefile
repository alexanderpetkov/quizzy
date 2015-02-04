require 'sinatra/activerecord/rake'

require_relative 'server'

task :run do
  exec 'rerun --ignore "**/*.{js,css,html}" ruby server.rb'
end

task :console do
  exec 'pry -r ./server.rb'
end
