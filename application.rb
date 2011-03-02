require "rubygems"
require "sinatra"
require "mongo"
require "json/pure"
require "mongo"
require "mongo_mapper"
require "bson"
require "guid"
require './boot'

MongoMapper.connect(Sinatra::Base.environment)

get '/top/:api_key' do
  project = Project.first(params[:api_key])
  project.scores.to_json if project
end

get '/:api_key' do
  project = Project.first(params[:api_key])
  project.scores.to_json if project
end

post '/create/:api_key' do
  score = Score.new(request.body.read)
  score.project = Project.first(params[:api_key])
  score.save

  score.to_json
end

post '/game/create' do
  project = Project.first(params[:api_key])
  game = Game.create({:project_id => project.id})

  game.id
end

post '/scores/create' do
end

before '/projects/*' do
  protected!
end

post '/projects/create' do
  project = Project.new(JSON.parse(request.body.read))
  project.save

  project.to_json
end

