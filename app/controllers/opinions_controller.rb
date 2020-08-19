class OpinionsController < ApplicationController
  def index
    @opinions = Opinion.all
  end

  def new
    @opinion = Opinion.new
  end

  def create
    @opinion = current_user.opinions.new(opinion_params)
    if @opinion.save
      flash[:success] = 'Tweet sent'
      redirect_to root_path
    else
      render 'new', alert: 'Tweet was not sent'

    end
  end

  def destroy
    @opinion = Opinion.find_by(user_id: current_user.id)
    if @opinion.destroy
      flash[:alert] = 'Tweet deleted'
      redirect_to users_path(current_user.id)
    else
      flash[:alert] = 'Could not delete tweet'
      redirect_to :back
    end
  end

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
