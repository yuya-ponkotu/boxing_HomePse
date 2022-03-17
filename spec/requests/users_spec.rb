require 'rails_helper'

RSpec.describe "Users", type: :request do
  

  describe 'メンバー追加のテスト' do
    it 'ログインせずにメンバーを追加しようとしたらログインページに飛ぶてすと' do
      post users_path, params: {user: FactoryBot.attributes_for(:user_yuya)  }
      #リダイレクト先に移動します。
      follow_redirect!
      expect(response.body).to include "ログインもしくはアカウント登録してください"
    end

    it "ユーザー登録したら、ユーザー一覧ページにリダイレクト" do
      #メンバー追加のため、test@test.co.jpでログイン
      post '/owners', params: {owner: FactoryBot.attributes_for(:owner_test)}
      post users_path, params: {user: FactoryBot.attributes_for(:user_yuya)  }
      #リダイレクト先に移動します。
      follow_redirect!
      expect(response.body).to include "#{User.find(1).name}を登録しました"
    end

    it "名前が空欄の為ユーザー登録できないことをテスト" do
      #メンバー追加のため、test@test.co.jpでログイン
      post '/owners', params: {owner: FactoryBot.attributes_for(:owner_test)}
      post users_path, params: {user: FactoryBot.attributes_for(:user_yuya, name: "")  }
      #リダイレクト先に移動します。
      follow_redirect!
      expect(response.body).to include "名前が入力されてません"
    end

    it "読み仮名が空欄の為ユーザー登録できないことをテスト" do
      #メンバー追加のため、test@test.co.jpでログイン
      post '/owners', params: {owner: FactoryBot.attributes_for(:owner_test)}
      post users_path, params: {user: FactoryBot.attributes_for(:user_yuya, yomigana: "")  }
      #リダイレクト先に移動します。
      follow_redirect!
      expect(response.body).to include "読み方が入力されてません"
    end
  end
end
