class ApplicationController < ActionController::Base
  include SessionsHelper

  private

  def logged_in_user
    return if logged_in?
    flash[:notice] = 'Please login'
    redirect_to login_url
    
  end
end
