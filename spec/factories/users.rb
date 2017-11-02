FactoryBot.define do
  factory :user do
    sequence(:email){|n| "#{n}example@email.com"}
    sequence(:username){|n|"john #{n}doe"}
    password 'password'
  end
end
