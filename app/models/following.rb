class Following < ApplicationRecord
  belongs_to :follower, foreign_key: :FollowerId, class_name: 'User'

  
  belongs_to :followed_user, foreign_key: :FollowedId, class_name: 'User'
end
