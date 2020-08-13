class FollowingsController < ApplicationController
  def follow_user
    @user = User.find_by(id: params[:id])
    if current_user.follow(@user.id)
      flash[:notice] = 'Successfully added'
      redirect_to root_path
    else
      flash[:alert] = 'Hmm couldnt follow user'
    end
  end

  def unfollow_user
    @user = User.find_by(id: params[:id])
    if current_user.unfollow(@user.id)
      flash[:notice] = 'Successfully added'
      redirect_to root_path
    else
      flash[:alert] = 'Hmm couldnt follow user'
    end
  end
end
