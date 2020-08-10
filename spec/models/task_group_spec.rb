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
  describe 'Methods' do
    context '#parameters' do
      it 'should return number of task groups​' do
        n_users = 100
        expect(TaskGroup.parameters(n_users).count).to eq(16)
      end
    end

    context '#query_arguments' do
      it 'should return number of task groups​' do
        expect(TaskGroup.query_arguments.count).to eq(16)
      end
    end

    context '#number_of_user_per_group' do
      it 'should return number of users per group for n_users = 100' do
        n_users = 100
        expect(TaskGroup.number_of_user_per_group(n_users)).to eq([8, 8, 8, 8, 5, 5, 5, 5, 8, 8, 8, 8, 5, 5, 5, 5])
      end
    end
  end
end
