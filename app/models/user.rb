class User < ActiveRecord::Base
  has_many :authentication_tokens
  has_secure_password
  validates :password, length: { minimum: 8 }
  validates :email, presence: true, uniqueness: {message: "El e-mail ya se encuentra registrado"}
  has_many :eventos , foreign_key: 'owner_id'
end
