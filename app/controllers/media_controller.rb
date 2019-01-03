class MediaController < ApplicationController
  before_action :check_login_status, only: [:index, :create]

  # GET /media
  def index
  end

  # GET /media/1
  def show
  end

  # GET /media/upload
  def index_upload
  end

  # POST /media/upload
  def create_upload
  end

  private
    def check_login_status
      logged_in?
    end
end
