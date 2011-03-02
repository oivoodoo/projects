require "guid"

class Project
  include MongoMapper::Document

  key :title, String, :required => true
  key :score_ids, Array, :typecast => 'ObjectId'

  many :scores, :order => "scores.scores desc"
end

