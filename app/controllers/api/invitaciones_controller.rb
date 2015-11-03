module Api
  class InvitacionesController < ApplicationController

    def index
      invitaciones = Invitacion.where(user: current_user).map do |invitacion|
        { id: invitacion.id,
          id_evento: invitacion.evento.id,
          nombre_evento: invitacion.evento.nombre,
          fecha_evento: invitacion.evento.fecha,
          confirmado: invitacion.confirmado
        }
      end

      render json: { invitaciones: invitaciones }
    end
  end
end
