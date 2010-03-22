class CreatePollOptions < ActiveRecord::Migration
  def self.up
    create_table :poll_options do |t|
      t.string :value, :null => false, :default => ''
      t.references :poll
      t.timestamps
    end

    # Add database constraints here on polls
  end

  def self.down
    drop_table :poll_options
  end
end
