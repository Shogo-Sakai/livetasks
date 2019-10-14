class UsersController < ApplicationController
  before_action :set_birthdate,       only: [:signup, :create, :edit, :update]
  before_action :set_user,            only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user,   only: [:show, :edit]
  before_action :forbid_login_user,   only: [:login_form, :login, :signup, :create]
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
    @user = User.find_by(email: params[:email])
    if @user && @user.valid_password?(params[:password])
      sign_in @user
      flash[:notice] = "Login Success!!"
      redirect_to user_lives_path(user_id:@user.id)
    else
      @error_message = "E-mail or Password is not right."
      @email         = params[:email]
      @password      = params[:password]
      render("/users/login_form")
    end
  end

  def logout
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:notice] = "Created an account!!"
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
      sign_in @user
      redirect_to user_path(params[:id])
    else
      render "users/edit"
    end
  end

  def destroy
    if @user.destroy
      session[:live_id] = nil
      flash[:notice]    = "User Deleted."
      redirect_to root_path
    else
      @error_message    = "Has some error. Please check again."
      render :show
    end
  end

  def search
    @users = User.where('nickname LIKE(?) AND id != ?', "%#{params[:keyword]}%", current_user)
    respond_to do |format|
      format.html
      format.json
    end
  end

  private
    def user_params
      params[:user].permit(:nickname, :email, :password, :password_confirmation, :profile, :birthyear, :birthmonth, :birthday, :age, :gender, :image)
    end

end
