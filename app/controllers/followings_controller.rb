class FollowingsController < ApplicationController
  def create
    @user = User.find_by(id: params[:id])
    if current_user.follow(@user.id)
      flash[:success] = 'Successfully followed'
      redirect_to root_path
    else
      flash[:alert] = 'Hmm could not follow user'
      redirect_to :back
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if current_user.unfollow(@user.id)
      flash[:alert] = 'Unfollowed user'
      redirect_to root_path
    else
      flash[:alert] = 'Hmm couldnt unfollow user'
      redirect_to :back
    end
  end
end
