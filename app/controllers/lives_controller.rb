class LivesController < ApplicationController
  before_action :set_current_user
  def index
  end

  def new
    @live = Live.new
  end

  def create
    @live = Live.new(live_params)
    if @live.save
      flash[:notice] = "Created new Live Project!"
      redirect_to user_life_path(user_id: session[:user_id],id:params[:id])
    else
      @error_message = "Has some error. Please check again."
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def show
  end

  private
  def live_params
    params.require(:live).permit(:name, :date, :concept, :target, :budget,:image).merge(user_id: session[:user_id])
  end

  # ユーザー関係
  def set_current_user
    @current_user = User.find(session[:user_id])
  end
end
