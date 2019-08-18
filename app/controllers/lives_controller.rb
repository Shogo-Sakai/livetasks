class LivesController < ApplicationController
  before_action :set_current_user, only: [:index]
  def index
  end

  private
  def set_current_user
    @current_user = User.find(session[:user_id])
  end
end
