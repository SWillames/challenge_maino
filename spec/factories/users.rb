FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 8, max_length: 20, special_characters: true, mix_case: true) }
    name { Faker::Name.name }
    username { Faker::Internet.username(specifier: email.split('@').first) }
  end
end
