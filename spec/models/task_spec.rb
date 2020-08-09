require 'rails_helper'

RSpec.describe Task, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:task)).to be_valid
    end

    it "has a valid factory" do
      expect(build(:task_with_users)).to be_valid
    end
  end

  describe 'Association' do
    context 'has_many' do
      it { should have_many(:task_groups) }
      it { should have_many(:users) }
    end
  end

  describe 'Validations' do
    context 'presence and uniqueness' do
      it { should validate_presence_of(:title) }
    end
  end
end
