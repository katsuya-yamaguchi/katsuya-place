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
    media = Medium.new(media_params)
    media.save!
  end

  private
    def check_login_status
      logged_in?
    end

    def media_params
      params.require(:media).permit(:media_file_name)
    end
end
