class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.references :user
      t.references :poll_option
      t.string     :ip_address, :null => false, :default => ''
      t.datetime   :voted_at
    end

    #Add database constraints if necessary here on poll options and users
  end

  def self.down
    drop_table :votes
  end
end
