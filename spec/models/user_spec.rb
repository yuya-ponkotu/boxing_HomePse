require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'モデルのメソッドの確認' do
    it '入室処理の確認' do
      user_yuya = FactoryBot.create(:user_yuya)
      expect(user_yuya).to be_valid
      user_yuya.entry_room
      expect(user_yuya.in_room).to be_truthy
    end

    it '退室処理の確認' do
      user_yuya = FactoryBot.create(:user_yuya, in_room: true)
      expect(user_yuya).to be_valid
      user_yuya.exit_room
      expect(user_yuya.in_room).to be_falsey
    end
  end
end
