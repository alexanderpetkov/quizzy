require 'sinatra/activerecord'
require 'factory_girl'
require 'database_cleaner'
require 'rspec'
require 'quizzy'
require 'factories'

RSpec.configure do |rspec_config|
  rspec_config.before(:suite) do
    ActiveRecord::Tasks::DatabaseTasks.db_dir = 'models'
    ActiveRecord::Migrator.migrations_paths = '/db/migrate'

    ActiveRecord::Migrator.migrate 'db/migrate'
  end
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
end

# Clean the database after each test
RSpec.configure do |rspec_config|
  rspec_config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  ActiveRecord::Base.logger.level = 1

  rspec_config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end

Dir[File.dirname(__FILE__) + '/../models/*.rb'].each do |file|
  require_relative file
end

