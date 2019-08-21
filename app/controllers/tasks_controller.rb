class TasksController < ApplicationController
  before_action :set_current_items
  # before_action :set_staff_name, only: [:new, :create]
  def index
    @tasks = Task.where(live_id: @live.id)
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    # debugger
    if @task.save
      flash[:notice] = "Made a new task."
      redirect_to "/users/#{@current_user.id}/lives/#{@live.id}/#tasks"
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
  def task_params
    # debugger
    params.require(:task).permit(:kind, :content, :start_date, :finish_date, :finish, :memo, :user_id ).merge(live_id: @live.id )
    # debugger
  end

  def set_current_items
    @live = Live.find(session[:live_id])
    @current_user = User.find(session[:user_id])
  end
  
end