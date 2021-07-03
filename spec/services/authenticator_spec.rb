require 'rails_helper'

describe 'User::Authenticator' do

  describe 'authenticate' do

    example '正しいパスワードならtrueを返す' do

      user = build(:user)
      expect(User::Authenticator.new(user).authenticate('password')).to be_truthy

    end

    example '誤ったパスワードならfalseを返す' do

      user = build(:user)
      expect(User::Authenticator.new(user).authenticate('invalid_password')).to be_falsey

    end

    example 'パスワードが未設定ならfalseを返す' do

      user = build(:user, password: nil)
      expect(User::Authenticator.new(user).authenticate(nil)).to be_falsey

    end

    example '停止フラグが立っていればfalseを返す' do

      user = build(:user, suspended: true)
      expect(User::Authenticator.new(user).authenticate('pw')).to be_falsey

    end

  end

end
