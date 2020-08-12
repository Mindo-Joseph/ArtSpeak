class HomepageController < ApplicationController
  before_action :logged_in_user
  def index
    @opinions = Opinion.all
  end
end
