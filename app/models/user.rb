class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 20 }
  validates :fullname, presence: true
  has_one_attached :photo
  has_one_attached :coverImage
  has_many :opinions, dependent: :destroy
  # Returns an array of follows for the given user instance
  has_many :received_follows, foreign_key: :FollowedId, class_name: 'Following'
  has_many :followers, through: :received_follows, source: :follower

  # This will give the array of follows that this user gave to someone else
  has_many :given_follows, foreign_key: :FollowerId, class_name: 'Following'
  has_many :followings, through: :given_follows, source: :followed_user

  def follow(user_id)
    given_follows.create(FollowedId: user_id)
  end

  def unfollow(user_id)
    given_follows.find_by(FollowedId: user_id).destroy
  end
end
