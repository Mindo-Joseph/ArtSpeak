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

  private

  def opinion_params
    params.require(:opinion).permit(:text)
  end
end
