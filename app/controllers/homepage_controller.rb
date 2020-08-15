class HomepageController < ApplicationController
  before_action :logged_in_user
  def index
    following_ids = Following.where(FollowerId: current_user.id).pluck(:FollowedId)
    following_ids << current_user.id
    @opinions = if following_ids.size > 1
                  Opinion.includes(:user).where(user_id: following_ids).order(created_at: :desc)
                else
                  Opinion.includes(:user).where(user_id: following_ids).order(created_at: :desc).limit(5)
                end
    @opinion = Opinion.new
  end
end
