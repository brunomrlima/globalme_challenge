FactoryBot.define do
  factory :task do
    title { Faker::Lorem.word }

    factory :task_with_users do
      transient do
        task_group_count { 4 }
      end
      after(:create) do |task, evaluator|
        create_list(:task_group, evaluator.task_group_count, task: task)
      end
    end
  end
end
