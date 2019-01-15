class AdminArticleController < ApplicationController
  # GET /articles
  def index
    @articles = []
    Article.order(:updated_at).each do |article|
      @articles << article
    end
  end

  # GET /articles
  def show
  end
end
