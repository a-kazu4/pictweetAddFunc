class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships, id: false do |t|
      t.references :follower
      t.references :followee
    end
    add_index :friendships, :follower_id
    add_index :friendships, :followee_id
    add_index :friendships, [:follower_id, :followee_id], unique: true
  end
end
