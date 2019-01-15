require 'rails_helper'

RSpec.describe Article, type: :model do
  describe '#validates' do
    let(:article_params){
      {
        content_title: 'sample',
        content_url: 'https://sample.com',
        meta_description: 'sample',
        content_text: 'sample',
      }
    }

    let(:category){
      Category.create(category_name: 'test')
    }

    context ':content_titleが存在していない時、' do
      it 'バリデーションが失敗すること' do
        article_params[:content_title] = ''
        article = category.article.new(article_params)
        expect(article.valid?).to eq false
      end
    end

    context ':content_urlが存在していない時、' do
      it 'バリデーションが失敗すること' do
        article_params[:content_url] = ''
        article = category.article.new(article_params)
        expect(article.valid?).to eq false
      end
    end

    context ':content_textが存在していない時、' do
      it 'バリデーションが失敗すること' do
        article_params[:content_text] = ''
        article = category.article.new(article_params)
        expect(article.valid?).to eq false
      end
    end
  end
end
