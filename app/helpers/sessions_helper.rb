module SessionsHelper
  # 記憶トークンcookieに対応するユーザーを返す
  def current_user
    ## 一時セッションのチェック
    if user_id = session[:user_id]
      @current_user ||= AdminUser.find_by(id: user_id)
    ## 永続的セッションのチェック
    elsif user_id = cookies.signed[:user_id]
      user = AdminUser.find_by(id: user_id)
      if user && user.authenticated?(cookies[:remember_token])
        session[:user_id] = user.id
        @current_user = user
      end
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
