FactoryBot.define do
  factory :diary do
    title { Faker::Name.name } 
    content { Faker::Lorem.sentence }
    start_time { Faker::Date.between(from: 1.year.ago, to: Date.today)}
    weather_id  { Faker::Number.between(from: 2, to: 5) }
    place { '大阪' }
    association :user
    association :album

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
