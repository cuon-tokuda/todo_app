require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "validations" do
    it "is valid with a name" do
      task = build(:task)
      expect(task.valid?).to be true
    end

    it "is invalid without a name" do
      task = build(:task, name: nil)
      expect(task.valid?).to be false
    end
  end
end





