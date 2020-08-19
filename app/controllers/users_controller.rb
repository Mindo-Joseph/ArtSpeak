class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @opinions = @user.opinions.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'User created successfully'
      redirect_to @user
    else
      render 'new'
    end
  end

  def update
    @user = User.find(params[:id])
    return unless @user.update(user_params)

    flash[:success] = 'User updated'
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:alert] = 'Account Deleted'
      redirect_to root_path
    else
      redirect_to :back
    end
  end

  private

  def set_user; end

  def user_params
    params.require(:user).permit(:username, :fullname, :photo, :coverImage)
  end
end
