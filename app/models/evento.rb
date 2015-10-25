class Evento < ActiveRecord::Base

  validates_presence_of :nombre
  belongs_to :owner, class_name: User.name
  has_many :invitaciones, class_name: Invitacion.name

end
