require "rails_helper"
describe "User" do

  describe "#index" do
    it "is rendered to user index page"
  end

  describe "#signup" do
    it "is rendered to signup page"
  end

  describe "#login" do
    it "is invalid without email" do
      user = create(:user, nickname:"")
      expect(user.errors[:nickname]).to include("can't be blank")
    end

    it "is invalid without password"
    it "is valid with email and passoword"
    it "is rendered to login form page if failed"
  end

  describe "#create" do
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

  describe "#update" do
    it "is invalid without email"
    it "is invalid without password"
    it "is invalid without password confirmation"
    it "is valid with email, password and password confirmation"
  end

  describe "#destroy" do
    it "is invalid without user"
    it "is rendered to show page"
  end

  describe "#search" do
    it "is valid with keyword"
  end

end
