require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'validation' do
    let(:admin_user){
      AdminUser.new(email: 'sample@sample.com', password: '123456789', password_confirmation: '123456789')
    }

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
end
