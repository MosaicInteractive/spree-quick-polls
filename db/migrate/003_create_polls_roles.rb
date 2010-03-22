class CreatePollsRoles < ActiveRecord::Migration
  def self.up
    create_table :polls_roles, :id => false do |t|
      t.references :poll
      t.references :role
      t.timestamps
    end

    # Add database constraints here on polls and roles
  end

  def self.down
    drop_table :polls_roles
  end
end
