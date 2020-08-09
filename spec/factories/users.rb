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

    trait :child do
      age { "Child" }
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
  end
end