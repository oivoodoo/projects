class Game
  include MongoMapper::Document

  key :project_id, BSON::ObjectId, :required => true

  belongs_to :project
end

