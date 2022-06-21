FactoryBot.define do
  factory :album do
    name             {Faker::Name.initials(number: 2)}
    association :user
  end
end
