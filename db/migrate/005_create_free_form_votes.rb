class CreateFreeFormVotes < ActiveRecord::Migration
  def self.up
    create_table :free_form_votes do |t|
      t.references :user
      t.references :poll
      t.string     :value, :null => false, :default => ''
      t.string     :ip_address, :null => false, :default => ''
      t.datetime   :voted_at
    end
  end

  def self.down
    drop_table :free_form_votes
  end
end
