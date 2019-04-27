require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  let(:user) do
    user_params = {
      id: 1,
      created_at: Time.new,
      updated_at: Time.new,
      email: 'admin@admin.com',
      password: '123456789',
      password_confirmation: '123456789',
      remember_digest: 'aaaa'
    }
    AdminUser.new(user_params)
  end

  describe 'validation' do
    let(:admin_user) do
      AdminUser.new(email: 'sample@sample.com', password: '123456789', password_confirmation: '123456789')
    end

    it 'should be valid.' do
      expect(admin_user.valid?).to equal(true)
    end

    context 'when the name does exist,' do
      it 'validation success.' do
        admin_user.email = 'sample@sample.com'
        expect(admin_user.valid?).to equal(true)
      end
    end

    context 'when the length of password_digest is short,' do
      it 'validation fails.' do
        admin_user.password_digest = '1234567'
        expect(admin_user.valid?).to equal(false)
      end
    end

    context 'when the email format is invalid,' do
      it 'validation fails.' do
        admin_user.email = 'admin'
        expect(admin_user.valid?).to equal(false)
      end
    end

    context 'when the email is duplicated,' do
      it 'validation fails.' do
        admin_user.save!
        dup_admin_user = AdminUser.new(email: 'sample@sample.com', password_digest: '123456789')
        expect(dup_admin_user.valid?).to equal(false)
      end
    end
  end

  describe '#AdminUser.digest' do
    it 'successful generation of token.' do
      sample_text = '123456789'
      expect(AdminUser.digest(sample_text)).not_to eq nil
    end
  end

  describe '#remember' do
    it 'update of token succeeds.' do
      user.remember
      expect(user.remember_digest).not_to eq 'aaaa'
    end
  end

  describe '#authenticated?' do
    context 'when the token matches the digest,' do
      it 'return true.' do
        user.remember
        expect(user.authenticated?(user.remember_token)).to eq true
      end
    end
  end

  describe '#forget' do
    it 'remember_digest is nil.' do
      user.save!
      user.forget
      expect(user.remember_digest).to eq nil
    end
  end
end
