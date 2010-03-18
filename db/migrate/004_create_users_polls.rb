class CreateUsersPolls < ActiveRecord::Migration
  def self.up
    create_table :users_polls, :id => false do |t|
      t.references :user
      t.references :poll
      t.references :poll_option
      t.timestamps
    end

    #Add database specific foreign key constraints if necessary here
  end

  def self.down
    drop_table :users_polls
  end
end
