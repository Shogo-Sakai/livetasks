require "rails_helper"

describe UsersController do

  context "GET #index" do
    it "render to the user index page" do
      get :index
      expect(response).to render_template :index
    end
  end

  context "GET #signup" do
    it "should have a current_user" do
      user = create(:user)
      sign_in user
      expect(subject.current_user).to_not eq(nil)
    end
  end

  context "GET #login" do
    it "is invalid without email" do
      user  = create(:user)
      login = User.find_by(email: "")
      sign_in user
      post :login
      debugger
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without password"
    it "is valid with email and passoword"
    it "is rendered to login form page if failed"
  end

  context "#create" do
    it "is invalid without nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without email" do
      user = build(:user, email:"")
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "is invalid without password" do
      user = build(:user, password:"")
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "is invalid without password confirmation" do
      user = build(:user, password_confirmation:"")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "is valid with nickname, email, password and password confirmation" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "is rendered to signup page if create account failed"
    end

  context "#update" do
    it "is invalid without email"
    it "is invalid without password"
    it "is invalid without password confirmation"
    it "is valid with email, password and password confirmation"
  end

  context "#destroy" do
    it "is invalid without user"
    it "is rendered to show page"
  end

  context "#search" do
    it "is valid with keyword"
  end

end
