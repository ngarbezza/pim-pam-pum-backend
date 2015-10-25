class User < ActiveRecord::Base
  has_many :authentication_tokens
  has_secure_password
  validates :password, length: { minimum: 8 }
  validates :email, presence: {message: "El e-mail no puede ser vacío"},
                    uniqueness: {message: "El e-mail ya se encuentra registrado"}
  validates :username, presence: {message: "El nombre de usuario no puede ser vacío"},
                       uniqueness: {message: "El nombre de usuario ya se encuentra registrado"}
  has_many :eventos, foreign_key: 'owner_id'
  has_many :invitaciones, class_name: Invitacion.name
end
