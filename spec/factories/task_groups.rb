FactoryBot.define do
  factory :task_group do
    association :user
    association :task
  end
end
