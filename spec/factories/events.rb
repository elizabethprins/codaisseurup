FactoryGirl.define do
  factory :event do
    name              "Barbeque"
    description       { Faker::Lorem.sentence(40) }
    location          { Faker::Address.city }
    price             { Faker::Commerce.price }
    capacity          50
    includes_food     true
    includes_drinks   true
    starts_at         1.day.from_now
    ends_at           2.days.from_now
    active            true
    user              { build(:user) }

    trait :active do
      active true
    end

    trait :inactive do
      active false
    end
  end
end
