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

  describe '#current_user' do
    context 'when user_id is set for session,' do
      it 'current_user is set.' do
        user
        user.save!
        session[:user_id] = user.id
        current_user
        expect(@current_user).not_to eq nil
      end
    end

    context 'when user_id is not set for session,' do
      it 'current_user is set.' do
        user
        user.save!
        remember user
        current_user
        expect(@current_user).not_to eq nil
      end
    end
  end

  describe '#forget' do
    it 'the cookie is deleted.' do
      user.save!
      remember user
      forget user
      expect(cookies[:user_id]).to eq nil
      expect(cookies[:remember_token]).to eq nil
    end
  end
end
