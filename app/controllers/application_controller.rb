class ApplicationController < ActionController::Base
  # @userを定義する
  def set_user
    @user = User.find(params[:id])
  end

  # ログインしてない時の処理
  def authenticate_user
    if current_user.nil?
      redirect_to root_path
      flash[:notice] = "Need to Login"
    end
  end

  # 既にログインしている時の処理
  def forbid_login_user
    if current_user
      flash[:notice] = "You are already logined."
      redirect_to user_lives_path(user_id: current_user)
    end
  end

  # ユーザーにアクセス権限がない時の処理
  def ensure_correct_user
    if current_user.id != params[:id].to_i
      flash[:notice]    = "You don't have access authorizations."
      redirect_to user_lives_path(user_id: current_user)
    end
  end

  # 誕生日の表示メソッド
  def set_birthdate
    y        = 1950
    @year    = []
    while y <= 2009 do
      @year << [y,y]
      y     += 1
    end

    m         = 1
    @month    = []
    while m  <= 12 do
      @month << [m,m]
      m      += 1
    end

    d        = 1
    @day     =[]
    while d <= 31 do
      @day  << [d,d]
      d     += 1
    end
  end
  
end
