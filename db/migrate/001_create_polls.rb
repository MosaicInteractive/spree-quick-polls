class CreatePolls < ActiveRecord::Migration
  def self.up
    create_table :polls do |t|
      t.string :name, :null => false, :default => ''
      t.string :description, :null => false, :default => ''
      t.timestamps
    end
  end

  def self.down
    drop_table :polls
  end
end
