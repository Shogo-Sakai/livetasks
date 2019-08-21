class TasksController < ApplicationController
  before_action :set_current_items
  before_action :set_tasks, only: :toggle
  before_action :set_task, only: [:toggle, :edit, :update, :destroy]

  def index
    @tasks = Task.where(live_id: @live.id).order(finish_date: "ASC")
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
    if @task.update(task_params)
      @task.save
      flash[:notice] = "Edit Success!"
      redirect_to "/users/#{@current_user.id}/lives/#{@live.id}/#tasks"
    else
      @error_message = "Has some error. Please check again."
      render :edit
    end
  end

  def destroy
    @task.delete
    redirect_to "/users/#{@current_user.id}/lives/#{@live.id}/#tasks"
    flash[:notice] = "Task Deleted"
  end

  def show
  end

  def toggle
    # debugger
    @task.update_attributes(finish: !@task.finish)
  end

  private
  def task_params
    # debugger
    params.require(:task).permit(:kind, :content, :start_date, :finish_date, :finish, :memo, :user_id ).merge(live_id: @live.id )
    # debugger
  end

  def set_tasks
    @tasks = Task.where(live_id: @live.id)
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def set_current_items
    @live = Live.find(session[:live_id])
    @current_user = User.find(session[:user_id])
  end
  
end