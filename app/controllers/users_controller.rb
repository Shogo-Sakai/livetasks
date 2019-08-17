class UsersController < ApplicationController
  before_action :set_birthdate, only: [:signup, :create, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def signup
    @user = User.new
  end

  def login_form
    @user = User.new
  end

  def login
    @user = User.find_by(user_session_params)
    if @user
      flash[:notice]="ログインしました"
      redirect_to user_lives_path(user_id:@user.id)
    else
      # debugger
      render :login_form
    end
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
  end

  def edit
  end

  def update
    if @user.update(user_params)
      @user.save
      flash[:notice] = "Edit Success!!"
      # debugger
      redirect_to user_path(params[:id])
    else
      render "users/edit"
    end
  end

  private
    def user_params
      # debugger
      params.require(:user).permit(:nickname, :email, :password, :profile, :birthyear, :birthmonth, :birthday, :age, :gender, :image)
    end

    def user_session_params
      params.require(:user).permit(:email, :password_digest)
    end

    def set_user
      @user = User.find(params[:id])
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
