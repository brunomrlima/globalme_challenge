require 'rails_helper'

RSpec.describe TaskGroup, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:task_group)).to be_valid
    end
  end

  describe 'Association' do
    context 'has_many' do
      it { should belong_to(:user) }
      it { should belong_to(:task) }
    end
  end
end
