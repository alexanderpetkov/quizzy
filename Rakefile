require 'sinatra/activerecord/rake'
require 'rubocop/rake_task'
require 'rspec/core'
require 'rspec/core/rake_task'

require_relative 'server'

task :run do
  exec 'rerun --ignore "**/*.{js,css,html}" ruby server.rb'
end

RuboCop::RakeTask.new

RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end


task :console do
  exec 'pry -r ./server.rb'
end
