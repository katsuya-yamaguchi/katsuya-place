require 'rails_helper'
require 'rake'

describe ':admin_user_management' do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require 'tasks/admin_user_management'
    Rake::Task.define_task(:environment)
  end

  describe 'task :add_user' do
    it 'is a succeess thad the user was added.' do
  
      # 事前に環境変数ADMIN_PASSWORDを設定しておく。
      expect{ @rake['admin_user_management:add_user'].invoke }.to change{ AdminUser.count }.by(1)
    end
  end
  
  describe 'task :delete_user' do
    it 'is a succeess that the user was deleted.' do
      user_params = {
        id: 1,
        created_at: Time.new,
        updated_at: Time.new,
        email: 'admin@admin.com',
        password: '123456789',
        password_confirmation: '123456789'
      }
      user = AdminUser.new(user_params);
      user.save!
  
      expect{ @rake['admin_user_management:delete_user'].invoke }.to change{ AdminUser.count }.from(1).to(0)
    end
  end
end
