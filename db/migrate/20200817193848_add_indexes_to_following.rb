class AddIndexesToFollowing < ActiveRecord::Migration[6.0]
  def change
    add_index :followings, :FollowerId
    add_index :followings, :FollowedId
  end
end
