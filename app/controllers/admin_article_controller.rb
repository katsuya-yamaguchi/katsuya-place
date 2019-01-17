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
    article_id = get_article_id
    @article = Article.find(article_id)
    @category = Category.find(@article[:categories_id])
  end

  # POST /articles/:article_id
  def edit
    ## 既存の記事を取得する
    article_id = get_article_id
    article = Article.find(article_id)
    category = Category.find(article[:categories_id])

    ## 既存の記事を更新する処理
    article.update_attributes(article_params)
    category.update_attributes(category_params)
  end

  private
    def article_params
      params.require(:articles).permit(
        :content_title,
        :content_url,
        :meta_description,
        :content_text,
        :open_status,
        :fixed_status,
        :famous_status
      )
    end

    def category_params
      params.require(:articles).permit(:category_name)
    end

    # 「/admin_users/1/articles/1」の最後のIDを取得する処理
    def get_article_id
      request.fullpath.split('/').last.to_i
    end
end
