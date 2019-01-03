module SessionsHelper
  def current_user
    if session[:admin_user_id]
      @current_user ||= AdminUser.find_by(id: session[:admin_user_id])
    end
  end

  def logged_in?
    if current_user.nil?
      redirect_to login_path
    end
  end
end
