class FreeFormVote < ActiveRecord::Base
  belongs_to :vote
  #add validation to validate non empty answer
end
