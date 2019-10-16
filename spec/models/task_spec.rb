require "rails_helper"

describe "Task" do
  describe "#create" do
    it "is valid with content" do
      user = create(:user)
      live = create(:live)
      task = build(:task, user_id: user.id, live_id: live.id)
      task.valid?
      expect(task).to be_valid
    end

    it "is invalid without content" do
      user = create(:user)
      live = create(:live)
      task = build(:task, content:"", user_id: user.id, live_id: live.id)
      task.valid?
      expect(task.errors[:content]).to include("can't be blank")
    end

  end
end
