require 'rails_helper'

RSpec.describe NewArticleController, type: :controller do
  describe '#create' do
    include SessionsHelper

    let(:login) do
      user_params = {
        id: 1,
        created_at: Time.new,
        updated_at: Time.new,
        email: 'admin@admin.com',
        password: '123456789',
        password_confirmation: '123456789',
        remember_digest: 'aaaa'
      }
      user = AdminUser.new(user_params)
      user.save!
      remember user
    end

    let(:article_params) do
      {
        content_title: 'sample',
        content_url: 'https://sample.com',
        meta_description: 'sample',
        content_text: 'sample',
        category_name: 'rails',
        open_status: 0,
        fixed_status: 0,
        famous_status: 0,
        media_id: 1
      }
    end

    context 'カテゴリが既に登録されている場合、' do
      it '記事の作成に成功する' do
        login
        Category.create(category_name: 'rails')
        image_path = fixture_file_upload(Rails.root.join('app/assets/images', 'sample.jpg'))
        Medium.create(avatar: image_path)
        post :create, params: { articles: article_params, admin_user_id: 1 }

        expect(Article.exists?).to eq true
      end
    end

    context 'カテゴリが登録されていない場合、' do
      it '記事の作成に成功する' do
        login
        image_path = fixture_file_upload(Rails.root.join('app/assets/images', 'sample.jpg'))
        Medium.create(avatar: image_path)
        post :create, params: { articles: article_params, admin_user_id: 1 }

        expect(Category.exists?).to eq true
        expect(Article.exists?).to eq true
      end
    end
  end
end
