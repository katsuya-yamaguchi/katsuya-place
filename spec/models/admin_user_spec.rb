require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'validation' do
    let(:admin_user){
      AdminUser.new(email: 'sample@sample.com', password_digest: '123456789')
    }

    it 'should be valid.' do
      expect(admin_user.valid?).to equal(true)
    end

    context 'when the name does not exist,' do
      it 'validation fails.' do
        admin_user.email = ''
        expect(admin_user.valid?).to equal(false)
      end
    end

    context 'when the password_digest does not exist,' do
      it 'validation fails.' do
        admin_user.password_digest = ''
        expect(admin_user.valid?).to equal(false)
      end
    end
  end
end
