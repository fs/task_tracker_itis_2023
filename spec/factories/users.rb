FactoryBot.define do
  factory :user do
    first_name { "test" }
    last_name { "test" }
    sequence(:email) { |n| Faker::Internet.email.gsub('@', "-#{n}@") }
    role { "member" }
    password { "123456" }
  end
end
