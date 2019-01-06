class SessionsController < ApplicationController
  def index
    if session[:admin_user_id]
      session.delete(:admin_user_id)
    end
  end

  def create
    user = AdminUser.find_by(email: params[:sessions][:email].downcase)

    if session[:admin_user_id]
      session.delete(:admin_user_id)
    end

    if user && user.authenticate(params[:sessions][:password])
      session[:admin_user_id] = user.id
      params[:sessions][:remember_me] == 1 ? remember(user) : forget(user)
      redirect_to admin_user_new_article_index_path(admin_user_id: session[:admin_user_id])
    else
      flash.now[:danger] = 'email or password is invalid.'
      render :index
    end
  end

  def destroy 
  end
end
