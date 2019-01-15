require 'rails_helper'

RSpec.describe AdminArticleController, type: :controller do
  describe '#index' do
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

    let(:create_articles){
      for x in 1..10 do
        article_params = {
          content_title: x,
          content_url: x,
          meta_description: x,
          content_text: x,
          open_status: 0,
          fixed_status: 0
        }
        category = Category.create(category_name: x)
        article = category.article.create(article_params)
      end
    }

    it '記事一覧を取得できること' do
      login
      create_articles
      get :index, params: { admin_user_id: 1 }

      expect(controller.instance_variable_get('@articles').count).not_to eq nil
    end
  end
end
