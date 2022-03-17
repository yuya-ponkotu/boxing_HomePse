require "date"

FactoryBot.define do
  factory :user_yuya, class: 'User' do
    name {'五島　裕也'}
    in_room {false}
    yomigana {'ゴシマ　ユウヤ'}
  end
end
