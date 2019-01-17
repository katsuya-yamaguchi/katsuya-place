require 'rails_helper'

RSpec.describe ArticlesController, type: :controller do
  describe '#index' do
    it '人気記事が取得できること' do
      get :index
      expect(controller.instance_variable_get('@famous_articles')).not_to eq nil
    end
    it '記事が取得できること' do
      get :index
      expect(controller.instance_variable_get('@articles')).not_to eq nil
    end
  end

  describe '#show' do
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

    it '記事が取得できること' do
      create_articles
      get :show, params: { id: '1' }
      expect(controller.instance_variable_get('@article')).not_to eq nil
    end
  end
end
