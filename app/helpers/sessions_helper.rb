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

  # ユーザーのセッションを永続的にする
  def remember(user)
    user.remember
    ## cookieに暗号化したユーザーIDを設定する
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
end
