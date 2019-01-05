require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  let(:user){
    user_params = {
      id: 1,
      created_at: Time.new,
      updated_at: Time.new,
      email: 'admin@admin.com',
      password: '123456789',
      password_confirmation: '123456789',
      remember_digest: 'aaaa'
    }
    AdminUser.new(user_params);
  }

  describe '#remember' do
    it 'user id is set for cookie.' do
      remember user
      expect(cookies[:user_id]).not_to eq nil
    end

    it 'token is set for cookie.' do
      remember user
      expect(cookies[:remember_token]).not_to eq nil
    end
  end
end
