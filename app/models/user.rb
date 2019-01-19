class User < ApplicationRecord
  has_secure_password

  validates :password_confirmation, presence: true
  validates :username, presence: true
end
