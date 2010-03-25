class CreateFreeFormVotes < ActiveRecord::Migration
  def self.up
    create_table :free_form_votes do |t|
      t.references :vote
      t.string     :value, :null => false, :default => ''
    end

    # Add database specific foreign key references to votes table here
  end

  def self.down
    drop_table :free_form_votes
  end
end
