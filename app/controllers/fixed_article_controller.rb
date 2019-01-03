class FixedArticleController < ApplicationController
  before_action :check_login_status, only: [:index, :create]

  def index
  end

  def show
  end

  def create
  end

  def update
  end

  private
    def check_login_status
      logged_in?
    end
end
