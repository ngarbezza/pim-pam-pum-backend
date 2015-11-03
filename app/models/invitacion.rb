class Invitacion < ActiveRecord::Base
  self.table_name = :invitaciones

  belongs_to :evento
  belongs_to :user

  SIN_CONFIRMAR = 'SIN_CONFIRMAR'
  ACEPTADA = 'ACEPTADA'
  RECHAZADA = 'RECHAZADA'
  EN_DUDA = 'EN_DUDA'
  ESTADOS = [SIN_CONFIRMAR, ACEPTADA, RECHAZADA, EN_DUDA]

  validates :estado, presence: true, inclusion: { in: ESTADOS }

  def sin_confirmar?
    estado == SIN_CONFIRMAR
  end

  def aceptada?
    estado == ACEPTADA
  end

  def rechazada?
    estado == RECHAZADA
  end

  def en_duda?
    estado == EN_DUDA
  end
end
