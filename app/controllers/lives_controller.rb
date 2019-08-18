class LivesController < ApplicationController
  before_action :set_session_user, only: [:index]
  def index
  end

  private
  def set_session_user
    @session_user = User.find(session[:user_id])
  end
end
