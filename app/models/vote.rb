class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll_option
  has_one :free_form_vote
end
