FactoryBot.define do
  factory :user do
    first_name { "test" }
    last_name { "test" }
    email { "admin@admin.ru" }
    role { "member" }
    password { "123456" }
  end
end
