class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def signup
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

  def create
    user = User.create(user_params)
    if user.save
      redirect_to users_path

    else
      render back_path
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
    params.permit(:nickname, :email, :password, :profile, :birthyear, :birthmonth, :birthday, :age, :gender, :image)
  end

end
