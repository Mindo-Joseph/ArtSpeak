class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 20 }
  validates :fullname, presence: true
  has_one_attached :photo
  has_one_attached :coverImage
  has_many :opinions
end
