class AdminUser < ApplicationRecord
  attr_accessor :remember_token
  VALD_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALD_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password_digest, length: { minimum: 8 }
  has_secure_password

  class << self
    # 与えられた文字列からハッシュを作成する
    def digest(string)
      #＃ ActiveModel::SecurePassword.min_cost は development ではTrueになる。
      ## BCrypt::Engine::MIN_COSTは4（develop環境）
      ## BCrypt::Engine.costは10（production環境）
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # 記憶トークンを生成する
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # 記憶トークンを更新する
  def remember
    ## インスタンス毎に記憶トークンを生成したため、self.remember_tokenとしている。
    self.remember_token = AdminUser.new_token
    update_attribute(:remember_digest, AdminUser.digest(remember_token))
  end

  # トークンとダイジェストが一致したらtrueを返す
  def authenticated?(remember_token)
    ## remember_tokenをハッシュ化したものがremember_digestと一致したらtrueを返す
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # 記憶トークンの初期化
  def forget
    update_attribute(:remember_digest, nil)
  end
end
