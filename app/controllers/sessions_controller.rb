class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = 'User not found'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
