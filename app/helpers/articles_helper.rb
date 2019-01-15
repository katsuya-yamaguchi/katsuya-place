module ArticlesHelper
  def article_params
    params.require(:articles).permit(
      :content_title,
      :content_url,
      :meta_description,
      :content_text,
      :open_status,
      :fixed_status
    )
  end

  def category_params
    params.require(:articles).permit(:category_name)
  end

  def create_article
  end
end
