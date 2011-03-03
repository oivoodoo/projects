require 'bundler/setup'
require 'mongo_mapper'

MongoMapper.config = {
  :development  => {"uri" => "mongodb://localhost/projects_development"},
  :test         => {"uri" => "mongodb://localhost/projects_test"},
  :production   => {"uri" => ENV["MONGOHQ_URL"]}
}

Dir["./models/*.rb"].each {|f| require f}
Dir["./lib/*.rb"].each {|f| require f}

