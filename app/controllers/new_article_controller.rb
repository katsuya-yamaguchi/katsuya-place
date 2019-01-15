class NewArticleController < ApplicationController
  before_action :check_login_status, only: [:index, :create]

  def index
  end

  def create
    create_article
  end

  private
    def check_login_status
      logged_in?
    end
end
