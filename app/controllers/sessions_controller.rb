class SessionsController < ApplicationController
  def index
    session.delete(:user_id) if session[:user_id]
  end

  def create
    user = AdminUser.find_by(email: params[:sessions][:email].downcase)

    session.delete(:user_id) if session[:ser_id]

    if user&.authenticate(params[:sessions][:password])
      session[:user_id] = user.id
      params[:sessions][:remember_me] == 1 ? remember(user) : forget(user)
      redirect_to admin_user_new_article_index_path(admin_user_id: session[:user_id])
    else
      flash.now[:danger] = 'email or password is invalid.'
      render :index
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
