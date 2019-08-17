class UsersController < ApplicationController
  before_action :set_birthdate, only: [:signup, :create, :edit, :update]
  def index
    @users = User.all
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    # debugger
    if @user.save
      redirect_to users_path
    else
      render :signup
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Edit Success!!"
      redirect_to user_path(params[:id])
    else
      render "users/edit"
    end
  end

  def destroy
  end

  private
  def user_params
    # debugger
    params.require(:user).permit(:nickname, :email, :password, :profile, :birthyear, :birthmonth, :birthday, :age, :gender, :image)
  end

    # 誕生日の表示メソッド
  def set_birthdate
    y = 1950
    @year = []
    while y <= 2009 do
      @year << [y,y]
      y += 1
    end

    m = 1
    @month = []
    while m <= 12 do
      @month << [m,m]
      m += 1
    end

    d = 1
    @day =[]
    while d <=31 do
      @day << [d,d]
      d += 1
    end

  end

end
