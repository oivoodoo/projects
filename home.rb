require "rubygems"
require "sinatra"
require "mongo"

require "#{File.expand_path(File.dirname(__FILE__))}/config/db.rb"

class Home < Sinatra::Base

  get '/top' do
  end

  get '/' do
  end

end