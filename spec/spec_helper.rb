ENV['RACK_ENV'] = 'test'

require 'factory_girl'
require 'sinatra/activerecord'
require 'database_cleaner'
require 'rspec'
require 'factories'

require 'quizzy'


RSpec.configure do |rspec_config|
  rspec_config.include FactoryGirl::Syntax::Methods

  rspec_config.before(:suite) do
    ActiveRecord::Tasks::DatabaseTasks.db_dir = 'models'
    ActiveRecord::Migrator.migrations_paths = '/db/migrate'
    ActiveRecord::Base.logger.level = 1
    ActiveRecord::Migration.verbose = false
    ActiveRecord::Migrator.migrate 'db/migrate'

    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  rspec_config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

Dir[File.dirname(__FILE__) + '/../models/*.rb'].each do |file|
  require_relative file
end

