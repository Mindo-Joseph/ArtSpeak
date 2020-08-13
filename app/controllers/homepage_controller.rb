class HomepageController < ApplicationController
  before_action :logged_in_user
  def index
    @opinions = Opinion.all.sort.reverse
    @opinion = Opinion.new
  end
end
