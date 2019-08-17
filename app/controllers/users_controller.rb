class UsersController < ApplicationController
  before_action :set_birthdate, only: [:signup, :create]
  def index
    @users = User.all
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "New User Registered!!"
      redirect_to users_path
    else
      # debugger
      render :signup
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def user_params
    # debugger
    params.permit(:nickname, :email, :password, :profile, :birthyear, :birthmonth, :birthday, :age, :gender, :image)
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
