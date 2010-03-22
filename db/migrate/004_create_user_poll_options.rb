class CreateUserPollOptions < ActiveRecord::Migration
  def self.up
    create_table :user_poll_options, :id => false do |t|
      t.references :user
      t.references :poll_option
      t.string     :ip_address
      t.datetime   :voted_at
    end

    #Add database specific foreign key constraints if necessary here on poll options and users
  end

  def self.down
    drop_table :users_polls
  end
end
