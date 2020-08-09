FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }

    trait :female do
      gender { "Female" }
    end

    trait :male do
      gender { "Male" }
    end

    trait :children do
      age { "Children" }
    end

    trait :adult do
      age { "Adult" }
    end

    trait :english do
      nationality { "English" }
    end

    trait :french do
      nationality { "French" }
    end

    trait :indian do
      nationality { "Indian" }
    end

    trait :japanese do
      nationality { "Japanese" }
    end

    factory :user_with_tasks do
      transient do
        task_group_count { 2 }
      end
      after(:create) do |user, evaluator|
        create_list(:task_group, evaluator.task_group_count, user: user)
      end
    end
  end
end