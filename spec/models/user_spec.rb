require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:user)).to be_valid
    end

    it "has a valid trait" do
      expect(build(:user, :female)).to be_valid
    end

    it "has a valid trait" do
      expect(build(:user, :male, :adult, :english)).to be_valid
    end
  end
end
