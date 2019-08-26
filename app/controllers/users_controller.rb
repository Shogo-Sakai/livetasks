class UsersController < ApplicationController
  before_action :set_birthdate, only: [:signup, :create, :edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_current_user, only: [:index, :show, :edit, :search, :destroy]
  before_action :authenticate_user, only: [:show, :edit]
  before_action :forbid_login_user, only: [:login_form, :login, :signup, :create]
  before_action :ensure_correct_user, only: [:edit]

  def index
    @users = User.all
  end

  def signup
    @user = User.new
  end

  def login_form
  end

  def login
    # debugger
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:live_id] = nil
      flash[:notice]="Login Success!!"
      redirect_to user_lives_path(user_id:@user.id)
    else
      # debugger
      @error_message = "E-mail or Password is not right."
      @email = params[:email]
      @password = params[:password]
      render("/users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    session[:live_id] = nil
    flash[:notice] = "Logout Success."
    redirect_to root_path
  end

  def create
    @user = User.new(user_params)
    # debugger
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_lives_path(user_id: @user.id)
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

  def destroy
    if @user.destroy
      session[:user_id] = nil
      session[:live_id] = nil
      flash[:notice] = "User Deleted."
      redirect_to root_path
    else
      @error_message = "Has some error. Please check again."
      render :show
    end
  end

  def search
    @users = User.where('nickname LIKE(?) AND id != ?', "%#{params[:keyword]}%", @current_user)
    respond_to do |format|
      format.html
      format.json
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

    # ユーザーログイン関係
    def set_user
      @user = User.find(params[:id])
    end

    def set_current_user
      @current_user = User.find(session[:user_id])
    end

    def authenticate_user
      if @current_user == nil
        flash[:notice] = "Need to Login"
        redirect_to root_path
      end
    end

    def forbid_login_user
      if @current_user
        flash[:notice] = "You are already logined."
        redirect_to user_lives_path(user_id: @current_user)
      end
    end

    def ensure_correct_user
      if @current_user.id != params[:id].to_i
        flash[:notice] = "You don't have access authorizations."
        redirect_to user_lives_path(user_id: @current_user)
      end
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
