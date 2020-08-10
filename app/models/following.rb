class Following < ApplicationRecord
  # The one following
  belongs_to :follower, foreign_key: :FollowerId, class_name: "User"

  # The one being followed
  belongs_to :followed_user, foreign_key: :FollowedId, class_name: "User"
end
