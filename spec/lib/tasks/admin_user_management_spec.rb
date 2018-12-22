require 'rails_helper'
require 'rake'

describe 'task :add_admin_user' do
  before(:all) do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require 'tasks/admin_user_management'
    Rake::Task.define_task(:environent)
  end
  context 'when create admin user,' do
    let(:user_params){
      {
        id: 1,
        created_at: Time.new,
        updated_at: Time.new,
        email: 'admin@admin.com',
        password_digest: '123456789'
      }
    }

    it 'succeeds.' do
      expect{ @rake['admin_user_management:add_user'].invoke }.to change{ AdminUser.count }.by(1)
    end
  end
end
