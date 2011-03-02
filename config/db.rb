require 'rubygems'
require 'mongo'
require 'yaml'

File.open("#{File.expand_path(File.dirname(__FILE__))}/db.yml") {|f| @config = YAML.load(f) }
connection = @config['development']

db = Mongo::Connection.new(connection[:host]).db(connection[:database])
db.authenticate(connection[:username], connection[:password])

