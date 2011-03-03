require "rubygems"
require "sinatra"
require "json/pure"
require "mongo"
require "mongo_mapper"
require "bson"
require './boot'

MongoMapper.connect(Sinatra::Base.environment)

get '/top/json' do
  Score.all(:limit => 13).to_json
end

get '/json' do
  Score.all(:limit => 100).to_json
end

post '/create' do
  score = Score.create(request.body.read)

  score.to_json
end

