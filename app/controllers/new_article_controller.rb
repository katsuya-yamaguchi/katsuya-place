class NewArticleController < ApplicationController
  before_action :check_login_status, only: [:index, :create]

  def index
  end

  def create
    if Category.where(category_name: params[:articles][:category_name])
      category = ''
      Category.where(category_name: params[:articles][:category_name]).each do |ct|
        category = ct
      end
    else
      category = Category.new(category_params)
      category.save!
    end

    article = category.article.build(article_params)
    article.save!

    redirect_to admin_user_new_article_index_path
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
        :famous_status,
        :top_image
      )
    end

    def category_params
      params.require(:articles).permit(:category_name)
    end

    def media_params
      params.require(:media).permit(:avatar)
    end
end
