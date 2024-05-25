FactoryBot.define do
  factory :user do
    email {'new_user@example.com'}
    password {'password'}
    account_type {'patient'}
  end
end