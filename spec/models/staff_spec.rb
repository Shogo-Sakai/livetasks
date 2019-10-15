require "rails_helper"

describe "Staff" do
  describe "#create" do

    it "is valid with user_id and live_id" do
      user = create(:user)
      live = create(:live)
      staff = Staff.new(user_id: user.id, live_id: live.id)
      staff.valid?
      expect(staff).to be_valid
    end

    it "is invalid without user_id" do
      live  = create(:live)
      staff = Staff.create(user_id: "", live_id: live.id)
      staff.valid?
      # debugger
      expect(staff.errors[:user]).to include("must exist")
    end

    it "is invalid without live_id" do
      user  = build(:user)
      staff = Staff.create(user_id: user.id, live_id: "")
      staff.valid?
      expect(staff.errors[:live]).to include("must exist")
    end

  end
end
