class FollowingsController < ApplicationController
  def follow_user
    @user = User.find_by(id: params[:id])
    if current_user.follow(@user.id)
      flash[:success] = 'Successfully followed'
      redirect_to root_path
    else
      flash[:alert] = 'Hmm couldnt follow user'
    end
  end

  def unfollow_user
    @user = User.find_by(id: params[:id])
    if current_user.unfollow(@user.id)
      flash[:alert] = 'Unfollowed user'
      redirect_to root_path
    else
      flash[:alert] = 'Hmm couldnt unfollow user'
    end
  end
end
