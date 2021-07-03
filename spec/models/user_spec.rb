require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#password=(raw_password)' do

    example 'raw_passwordが文字列の時、60文字のhashed_passwordになる' do

      user = User.new
      user.password = 'password'
      expect(user.hashed_password).to be_kind_of(String)
      expect(user.hashed_password.size).to eq(60)

    end

    example 'nilを与えると、hashed_passwordはnilになる' do

      user = User.new
      user.password = nil
      expect(user.hashed_password).to eq(nil)

    end

  end

end
