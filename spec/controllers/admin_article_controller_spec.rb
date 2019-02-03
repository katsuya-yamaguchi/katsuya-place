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
          fixed_status: 0,
          famous_status: 0
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

  describe '#show' do
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
      image_path = fixture_file_upload(Rails.root.join('app/assets/images', 'sample.jpg'))
      Medium.create(avatar: image_path)

      for x in 1..10 do
        article_params = {
          content_title: x,
          content_url: x,
          meta_description: x,
          content_text: x,
          open_status: 0,
          fixed_status: 0,
          famous_status: 0,
          media_id: 1
        }
        category = Category.create(category_name: x)
        article = category.article.create(article_params)
      end
    }

    it '記事情報が取得できること' do
      login
      create_articles
      get :show, params: { admin_user_id: 1, article_id: 1 }
      expect(controller.instance_variable_get('@article')).not_to eq nil
      expect(controller.instance_variable_get('@category')).not_to eq nil
    end
  end

  describe '#edit' do
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
      image_path = fixture_file_upload(Rails.root.join('app/assets/images', 'sample.jpg'))
      Medium.create(avatar: image_path)

      article_params = {
        content_title: 'テスト用のタイトル',
        content_url: '/test',
        meta_description: 'テスト用のディスクリプションです。',
        content_text: 'テスト用のコンテンツテキストです。',
        open_status: 0,
        fixed_status: 0,
        famous_status: 0,
        media_id: 1
      }
      category = Category.create(category_name: 'rails')
      article = category.article.create(article_params)
    }

    let(:update_params){
      {
        content_title: 'sample',
        content_url: '/sample.com',
        meta_description: 'sample',
        content_text: 'sample',
        category_name: 'sample',
        open_status: 0,
        fixed_status: 0,
        famous_status: 0
      }
    }

    it '記事の更新が成功すること' do
      login
      create_articles
      post :edit, params:{ articles: update_params, admin_user_id: 1, article_id: 1 }
      expect(Article.find(1)[:content_title]).to eq 'sample'
      expect(Category.find(1)[:category_name]).to eq 'sample'
    end
  end
end
