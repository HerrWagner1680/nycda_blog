class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.integer :follower_id
      t.integer :leader_id

      t.timestamps
    end
    add_index :followers, :follower_id
    add_index :followers, :leader_id
    add_index :followers, [:follower_id, :leader_id], unique: true
  end
end
