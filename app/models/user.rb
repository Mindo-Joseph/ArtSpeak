class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 20 }, uniqueness: true
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

  after_commit :add_default_cover, :add_default_photo , on: [:create, :update]
  def follow(user_id)
    given_follows.create(FollowedId: user_id)
  end

  def unfollow(user_id)
    given_follows.find_by(FollowedId: user_id).destroy
  end
  private 
  def add_default_cover
    unless coverImage.attached?
      self.coverImage.attach(io: File.open(Rails.root.join("app", "assets", "images", "cover.webp")), filename: 'cover.webp' , content_type: "image/webp")
      
    end

  end
  def add_default_photo
    unless photo.attached?
      self.photo.attach(io: File.open(Rails.root.join("app", "assets", "images", "default_profile.jpg")), filename: 'default_profile.jpg' , content_type: "image/jpg")
      
    end

  end
  
end
