class NewArticleController < ApplicationController
  before_action :check_login_status, only: [:index, :create]

  def index
  end

  def create
    category = Category.new(category_params)
    category.save!
    article = category.article.build(article_params)
    article.save!
  end

  private
    def check_login_status
      logged_in?
    end

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
end
