module SessionsHelper
  # 記憶トークンcookieに対応するユーザーを返す
  def current_user
    ## 一時セッションのチェック
    if user_id = session[:user_id]
      @current_user ||= AdminUser.find_by(id: user_id)
    ## 永続的セッションのチェック
    elsif user_id = cookies.signed[:user_id]
      user = AdminUser.find_by(id: user_id)
      ## 記憶トークンが正しいかチェック
      if user&.authenticated?(cookies[:remember_token])
        session[:user_id] = user.id
        @current_user = user
      end
    end
  end

  def logged_in?
    redirect_to login_path if current_user.nil?
  end

  # ユーザーのセッションを永続的にする
  def remember(user)
    user.remember
    ## cookieに暗号化したユーザーIDを設定する
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end

  # 永続的セッションを破棄する
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  def log_out
    forget current_user
    session.delete(:user_id)
    @current_user = nil
  end
end
