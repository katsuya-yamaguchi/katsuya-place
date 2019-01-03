require 'rails_helper'

RSpec.describe SessionsHelper, type: :helper do
  describe '#AdminUser.digest' do
    it 'successful generation of token.' do
      sample_text = '123456789'
      expect(AdminUser.digest(sample_text)).not_to eq nil
    end
  end

  describe '#remember' do
    it 'update of token succeeds.' do
      user_params = {
        id: 1,
        created_at: Time.new,
        updated_at: Time.new,
        email: 'admin@admin.com',
        password: '123456789',
        password_confirmation: '123456789',
        remember_digest: 'aaaa'
      }
      user = AdminUser.new(user_params);
      user.remember
      expect(user.remember_digest).not_to eq 'aaaa'
    end
  end
end
