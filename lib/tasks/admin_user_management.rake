namespace :admin_user_management do
  desc ''
  task :add_user => :environment do
    if AdminUser.all[0]
      p '[ERROR] 既に管理ユーザーが作成されています。'
      exit
    end
    
    unless ENV['ADMIN_EMAIL'] || ENV['ADMIN_PASSWORD']
      p '[ERROR] 管理者ユーザー情報を環境変数に設定して下さい。(email or password)'
      exit
    end

    user_params = {
      id: 1,
      created_at: Time.new,
      updated_at: Time.new,
      email: ENV['ADMIN_EMAIL'],
      password: ENV['ADMIN_PASSWORD'],
      password_confirmation: ENV['ADMIN_PASSWORD']
    }

    user = AdminUser.new(user_params);
    user.save!
    p '[INFO] ユーザーの追加に成功しました。'
  end

  task :delete_user => :environment do
    if AdminUser.count == 0
      p '[INFO] 既にユーザーは削除されています。'
      exit
    end

    AdminUser.find(1).delete
    p '[INFO] ユーザーの削除に成功しました。'
  end
end
