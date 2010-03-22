class PollOption < ActiveRecord::Base
  belongs_to :poll
  has_many :user_poll_options
end
