require "rails_helper"

describe "Live" do
  describe "#create" do
    it "is invalid without name" do
      live = build(:live, name:"")
      live.valid?
      expect(live.errors[:name]).to include("can't be blank")
    end

    it "is valid with name" do
      live = build(:live)
      live.valid?
      expect(live).to be_valid
    end
  end
end
