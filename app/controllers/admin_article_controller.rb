class AdminArticleController < ApplicationController
  # GET /articles
  def index
    @articles = []
    Article.order(:updated_at).each do |article|
      @articles << article
    end
  end

  # GET /articles/:article_id
  def show
    article_id = request.fullpath.split('/').last.to_i
    @article = Article.find(article_id)
    @category = Category.find(@article[:categories_id])
  end
end
