require 'rails_helper'

RSpec.describe User, type: :model do
  context "valid Factory" do
    it "should expect an invalid factory" do
      expect(build(:user)).to_not be_valid
    end

    it "has a valid factory" do
      expect(build(:user_with_tasks, :male, :adult, :english)).to be_valid
    end

    it "has a valid trait" do
      expect(build(:user, :male, :adult, :english)).to be_valid
    end
  end

  describe 'Association' do
    context 'has_many' do
      it { should have_many(:task_groups) }
      it { should have_many(:tasks) }
    end
  end

  describe 'Validations' do
    context 'presence and uniqueness' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:email) }
      it { should validate_uniqueness_of(:email) }
      it { should validate_presence_of(:gender) }
      it { should validate_presence_of(:age) }
      it { should validate_presence_of(:nationality) }
    end
  end
end
