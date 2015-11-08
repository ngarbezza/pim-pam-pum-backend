module Api
  class InvitacionesController < ApplicationController

    before_action :cargar_invitacion, only: [:aceptar, :rechazar]

    def invitar
      evento = Evento.find_by(id: params[:id_evento])
      params[:nombres_de_usuario].each do |nombre_de_usuario|
        usuario = User.find_by(username: nombre_de_usuario)
        if evento.present? && usuario.present?
          Invitacion.create! evento: evento, usuario: usuario
          InvitacionMailer.nueva_invitacion(current_user, evento, usuario).deliver_later
        end
      end
    end

    def index
      invitaciones = Invitacion.where(user: current_user).map(method(:invitacion_response))

      render json: { invitaciones: invitaciones }
    end

    def aceptar
      @invitacion.aceptar

      render json: wrapped_invitacion_response(@invitacion)
    end

    def rechazar
      @invitacion.rechazar

      render json: wrapped_invitacion_response(@invitacion)
    end

    private

    def cargar_invitacion
      @invitacion = Invitacion.find(params[:id])
    end

    def invitacion_response(invitacion)
      invitacion.attributes.merge({
        sin_confirmar: invitacion.sin_confirmar?,
        aceptada: invitacion.aceptada?,
        rechazada: invitacion.rechazada?,
        en_duda: invitacion.en_duda?,
        id_evento: invitacion.evento.id,
        nombre_evento: invitacion.evento.nombre,
        fecha_evento: invitacion.evento.fecha
      })
    end

    def wrapped_invitacion_response(invitacion)
      { invitacion: invitacion_response(invitacion) }
    end
  end
end
