class UserPollOption < ActiveRecord::Base
  belongs_to :user
  belongs_to :poll_option
end
