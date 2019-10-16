require "rails_helper"

describe UsersController do

  context "GET #index" do
    it "render to the user index page" do
      get :index
      expect(response).to render_template :index
    end

    it "populates an array of users" do
      users = create_list(:user, 5)
      get :index
      expect(assigns(:users)).to match(users)
    end
  end

  context "GET #signup" do

    it "render to the signup page" do
      get :signup
      expect(response).to render_template :signup
    end

    it "should have a current_user" do
      user = create(:user)
      sign_in user
      expect(subject.current_user).to_not eq(nil)
    end
  end

  context "GET #login" do
    before do
      @user = create(:user)
    end

    it "is valid with email and passoword" do
      post :login, params: {email: @user.email, password: @user.password}
      expect(response).to redirect_to user_lives_path(user_id: @user.id)
    end

    it "is invalid without email" do
      post :login, params: {email: "", password: @user.password}
      expect(response).to render_template :login_form
    end

    it "is invalid without password" do
      post :login, params: {email: @user.email, password: ""}
      expect(response).to render_template :login_form
    end

  end

  context "#create" do

    it "is redirected to user_lives_path with nickname, email, password and password confirmation" do
      user = create(:user)
      post :create, params: {user:{nickname:"nickname_test", email:"email@test.com", password:"nickname_test", password_confirmation:"nickname_test"}}
      expect(response).to redirect_to user_lives_path(user_id: user.id + 1)
    end

    it "is rendered to login_form without nickname" do
      post :create, params: {user:{nickname:"", email:"email@test.com", password:"nickname_test", password_confirmation:"nickname_test"}}
      expect(response).to render_template :signup
    end

    it "is rendered to signup page without email" do
      post :create, params: {user:{nickname:"nickname_test", email:"", password:"nickname_test", password_confirmation:"nickname_test"}}
      expect(response).to render_template :signup
    end

    it "is rendered to signup page without password" do
      post :create, params: {user:{nickname:"nickname_test", email:"email@test.com", password:"", password_confirmation:"nickname_test"}}
      expect(response).to render_template :signup
    end

    it "is rendered to signup page without password confirmation" do
      post :create, params: {user:{nickname:"nickname_test", email:"email@test.com", password:"nickname_test", password_confirmation:""}}
      expect(response).to render_template :signup
    end

  end

  context "#edit" do
    it "assigns the requested user to @user" do
      user = create(:user)
      sign_in user
      get :edit, params:{id: user.id}
      expect(assigns(:user)).to eq user
    end

    it "renders the :edit template" do
      user = create(:user)
      sign_in user
      get :edit, params:{id: user.id}
      expect(response).to render_template :edit
    end
  end

  context "#update" do
    before do
      @user = create(:user)
      sign_in @user
    end

    it "is redirected with email, password and password confirmation" do 
      patch :update, params: {id: @user.id, user:{nickname:"nickname_test", email:"email@test.com", password:"nickname_test", password_confirmation:"nickname_test"}}
      expect(@user.reload.nickname).to redirect_to user_path(id: @user.id)
    end

    it "is invalid without nickname" do
      patch :update, params: {id: @user.id, user:{nickname:"", email:"email@test.com", password:"nickname_test", password_confirmation:"nickname_test"}}
      expect(response).to render_template :edit
    end

    it "is invalid without email" do
      patch :update, params: {id: @user.id, user:{nickname:"nickname_test", email:"", password:"nickname_test", password_confirmation:"nickname_test"}}
      expect(response).to render_template :edit
    end
    
    it "is invalid without password" do
      patch :update, params: {id: @user.id, user:{nickname:"nickname_test", email:"email@test.com", password:"", password_confirmation:"nickname_test"}}
      expect(response).to render_template :edit
    end

    it "is invalid without password confirmation" do
      patch :update, params: {id: @user.id, user:{nickname:"nickname_test", email:"email@test.com", password:"nickname_test", password_confirmation:""}}
      expect(response).to render_template :edit
    end

  end

  context "#show" do

    it "is redirected to user show page" do
      user = create(:user)
      sign_in user
      get :show, params: {id: user}
      expect(response).to render_template :show
    end

  end

  context "#destroy" do
    before do
      @user = create(:user)
      sign_in @user
    end

    it "is redirected when user is deleted" do
      delete :destroy, params: {id: @user.id}
      expect(response).to redirect_to root_path
    end
    
    it "is deleted from database" do
      users = create_list(:user, 5)
      delete :destroy, params: {id: @user.id}
      expect(User.count).to eq 5
    end
  end

end
