class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def signup
  end

  def create
    user = User.create(user_params)
    if user.save
      redirect_to users_path

    else
      alert("入力項目に入力ください。")
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
    params.permit(:nickname, :email, :password, :profile, :birthday, :age, :gender, :image)
  end

end
