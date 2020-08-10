class Opinion < ApplicationRecord
  validates :text, presence: true, length: { maximum: 280, too_long: '280 characters in post is the maximum allowed.' }
  belongs_to :user
end
