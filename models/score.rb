class Score
  include MongoMapper::Document

  key :name, String, :required => true
  key :scores, Integer, :required => true

  belongs_to :project
end

