require File.join(File.dirname(__FILE__), '..', 'application.rb')

require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'rspec'
require 'mongo_mapper'
require 'database_cleaner'

Sinatra::Base.set :environment, :test
Sinatra::Base.set :run, false
Sinatra::Base.set :raise_errors, true
Sinatra::Base.set :logging, false

Spec::Runner.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end

