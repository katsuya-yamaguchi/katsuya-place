class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  VALD_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALD_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true, length: { minimum: 8 }
end
