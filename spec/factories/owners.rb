FactoryBot.define do
  factory :owner_test, class: 'Owner' do
    email {'test@test.co.jp'}
    password {'password'}
  end
end
