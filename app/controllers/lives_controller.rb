class LivesController < ApplicationController
  before_action :authenticate_live, except: [:index, :new, :create]
  before_action :authenticate_user
  before_action :set_session_live, only: :show
  before_action :set_live_tasks, only: :show

  def index
  end

  def new
    @live = Live.new
    @live.users << current_user
  end

  def create
    @live = Live.new(live_params)
    if @live.save
      flash[:notice] = "Created new Live Project!"
      redirect_to "/users/#{current_user.id}/lives/#{@live.id}"
      session[:live_id] = @live.id
    else
      @error_message = "Has some error. Please check again."
      render :new
    end
  end

  def edit
    @live = Live.find(params[:id])
  end

  def update
    @live = Live.find(params[:id])
    if @live.update(live_params)
      @live.save
      flash[:notice] = "Edit Success!"
      redirect_to "/users/#{current_user.id}/lives/#{@live.id}"
    else
      @error_message = "Has some error. Please check again."
      render :edit
    end
  end

  def destroy
    live = Live.find(params[:id])
    if live.destroy
      session[:live_id] = nil
      flash[:notice] = "Project Deleted."
      redirect_to "/users/#{current_user.id}/lives"
    else
      @error_message = "Has some error. Please check again."
      render :index
    end
    
  end

  def show
    @user = User.all.includes(:live, :task)
    @tasks = Task.where(live_id: @live.id).order(finish_date: "ASC")
  end

  private
  def live_params
    params.require(:live).permit(:name, :date, :concept, :target, :budget, :image, :start_time, :open_time, :place, :price, :entertainers, :file_place, :memo, { :user_ids => [] })
  end

  def set_live_tasks
    @tasks = Live.find(session[:live_id]).tasks.all
  end

  def set_session_live
      session[:live_id] = nil
      @live = Live.find(params[:id])
      session[:live_id] = @live.id
  end

  def authenticate_live
    unless current_user.staff_lives.ids.include?(params[:id].to_i)
      flash[:notice] = "Sorry, please try again."
      redirect_to user_lives_path(user_id: current_user)
    end
  end

end
