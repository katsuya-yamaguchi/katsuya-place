class NewArticleController < ApplicationController
  before_action :check_login_status, only: [:index, :create]

  def index
  end

  def create
  end

  private
    def check_login_status
      logged_in?
    end
end
