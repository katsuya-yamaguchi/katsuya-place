require 'rails_helper'

RSpec.describe NewArticleController, type: :controller do
  describe '#create' do
    include SessionsHelper

    let(:login){
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
      user.save!
      remember user
    }

    let(:article_params){
      {
        content_title: 'sample',
        content_url: 'https://sample.com',
        meta_description: 'sample',
        content_text: 'sample',
        category_name: 'rails',
      }
    }

    context 'open_statusが1のとき,' do
      it '記事の作成に成功する' do
        article_params.store('open_status', 0)
        login
        post :create, params:{ articles: article_params, admin_user_id: 1}

        expect(Category.find(1)).not_to eq nil
        expect(Article.find(1)).not_to eq nil
      end
    end
  end
end
