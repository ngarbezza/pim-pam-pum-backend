class User < ActiveRecord::Base
  has_many :authentication_tokens
  has_secure_password
  validates :password, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: true

  has_many :eventos , foreign_key: 'owner_id'
end
