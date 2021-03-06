class ArticlesController < ApplicationController

  # GET /articles
  def index
    @famous_articles = Article.where(famous_status: 1)
    @articles = Article.order(:updated_at)
  end

  # GET /articles/1
  def show
    article_url = '/'
    article_url << get_article_url
    @article = ''
    Article.where(content_url: article_url).each do |article|
      @article = article
    end
  end

  private
    # 「/articles/test」の最後のurlを取得する処理
    def get_article_url
      request.fullpath.split('/').last
    end
end
