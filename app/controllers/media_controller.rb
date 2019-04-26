class MediaController < ApplicationController
  before_action :check_login_status, only: %i[index create]

  # GET /media
  def index
    @medium = Medium.order(:id)
  end

  # GET /media/upload
  def index_upload
  end

  # POST /media/upload
  def create_upload
    media = Medium.new(media_params)
    media.save!
    redirect_to admin_user_media_upload_path
  end

  private
    def check_login_status
      logged_in?
    end

    def media_params
      params.require(:media).permit(:avatar)
    end
end
