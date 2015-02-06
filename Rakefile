require 'sinatra/activerecord/rake'
require 'rubocop/rake_task'

require_relative 'server'

task :run do
  exec 'rerun --ignore "**/*.{js,css,html}" ruby server.rb'
end

RuboCop::RakeTask.new

task :console do
  exec 'pry -r ./server.rb'
end
